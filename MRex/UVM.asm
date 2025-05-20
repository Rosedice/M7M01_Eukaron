
./Object/UVM:     file format elf64-x86-64


Disassembly of section .text:

0000000020000000 <_UVM_Entry>:
              space very well.
Input       : None.
Output      : None.
*****************************************************************************/
_UVM_Entry:
    JMP                 main
    20000000:	e9 69 02 00 00       	jmp    2000026e <main>

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
    200001b5:	e8 92 18 00 00       	call   20001a4c <UVM_Thd_Swt>
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
    200001fa:	bf 40 1d 00 20       	mov    $0x20001d40,%edi
    200001ff:	e8 04 0f 00 00       	call   20001108 <UVM_Print_String>
    UVM_LOG_I(sum/1000000);
    20000204:	48 8b 05 15 1e 00 00 	mov    0x1e15(%rip),%rax        # 20002020 <sum>
    2000020b:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000212:	de 1b 43 
    20000215:	48 f7 e2             	mul    %rdx
    20000218:	48 89 d0             	mov    %rdx,%rax
    2000021b:	48 c1 e8 12          	shr    $0x12,%rax
    2000021f:	48 89 c7             	mov    %rax,%rdi
    20000222:	e8 17 0c 00 00       	call   20000e3e <UVM_Print_Int>
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
    2000023c:	e8 0b 18 00 00       	call   20001a4c <UVM_Thd_Swt>
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
    middle=__UVM_X64_Read_TSC();
    20000253:	e8 c3 fd ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000258:	48 89 05 b1 1d 00 00 	mov    %rax,0x1db1(%rip)        # 20002010 <middle>
    UVM_Inv_Ret(param);
    2000025f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000263:	48 89 c7             	mov    %rax,%rdi
    20000266:	e8 79 fe ff ff       	call   200000e4 <UVM_Inv_Ret>
}
    2000026b:	90                   	nop
    2000026c:	c9                   	leave  
    2000026d:	c3                   	ret    

000000002000026e <main>:
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(ptr_t CPUID)
{
    2000026e:	f3 0f 1e fa          	endbr64 
    20000272:	55                   	push   %rbp
    20000273:	48 89 e5             	mov    %rsp,%rbp
    20000276:	4c 8d 9c 24 00 c0 ff 	lea    -0x4000(%rsp),%r11
    2000027d:	ff 
    2000027e:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    20000285:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    2000028a:	4c 39 dc             	cmp    %r11,%rsp
    2000028d:	75 ef                	jne    2000027e <main+0x10>
    2000028f:	48 83 ec 30          	sub    $0x30,%rsp
    20000293:	48 89 bd d8 bf ff ff 	mov    %rdi,-0x4028(%rbp)
    ptr_t Cur_Addr;
    cnt_t Count;
    cnt_t Count1;
    cnt_t Count2;
    ptr_t TEST_INV_STACK[2048];
    UVM_LOG_S("\r\nEnter user mode success!Welcome to RME system!");
    2000029a:	bf 68 1d 00 20       	mov    $0x20001d68,%edi
    2000029f:	e8 64 0e 00 00       	call   20001108 <UVM_Print_String>
    UVM_LOG_S("\r\nNow we are running init thread on cpu:");
    200002a4:	bf a0 1d 00 20       	mov    $0x20001da0,%edi
    200002a9:	e8 5a 0e 00 00       	call   20001108 <UVM_Print_String>
    UVM_LOG_I(CPUID);
    200002ae:	48 8b 85 d8 bf ff ff 	mov    -0x4028(%rbp),%rax
    200002b5:	48 89 c7             	mov    %rax,%rdi
    200002b8:	e8 81 0b 00 00       	call   20000e3e <UVM_Print_Int>
    if(CPUID==0) {
    200002bd:	48 83 bd d8 bf ff ff 	cmpq   $0x0,-0x4028(%rbp)
    200002c4:	00 
    200002c5:	0f 85 cf 0a 00 00    	jne    20000d9a <main+0xb2c>
        /*Empty test begins here*/
        sum=0;
    200002cb:	48 c7 05 4a 1d 00 00 	movq   $0x0,0x1d4a(%rip)        # 20002020 <sum>
    200002d2:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
    200002d6:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
    200002dd:	00 
    200002de:	eb 42                	jmp    20000322 <main+0xb4>
        {
            start=__UVM_X64_Read_TSC();
    200002e0:	e8 36 fd ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200002e5:	48 89 05 1c 1d 00 00 	mov    %rax,0x1d1c(%rip)        # 20002008 <start>
            end=__UVM_X64_Read_TSC();
    200002ec:	e8 2a fd ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200002f1:	48 89 05 20 1d 00 00 	mov    %rax,0x1d20(%rip)        # 20002018 <end>
            sum+=end-start;
    200002f8:	48 8b 05 19 1d 00 00 	mov    0x1d19(%rip),%rax        # 20002018 <end>
    200002ff:	48 8b 15 02 1d 00 00 	mov    0x1d02(%rip),%rdx        # 20002008 <start>
    20000306:	48 29 d0             	sub    %rdx,%rax
    20000309:	48 89 c1             	mov    %rax,%rcx
    2000030c:	48 8b 05 0d 1d 00 00 	mov    0x1d0d(%rip),%rax        # 20002020 <sum>
    20000313:	48 01 c8             	add    %rcx,%rax
    20000316:	48 89 05 03 1d 00 00 	mov    %rax,0x1d03(%rip)        # 20002020 <sum>
        for(Count=0;Count<1000000;Count++)
    2000031d:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    20000322:	48 81 7d e8 3f 42 0f 	cmpq   $0xf423f,-0x18(%rbp)
    20000329:	00 
    2000032a:	7e b4                	jle    200002e0 <main+0x72>
        }
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
    2000032c:	bf d0 1d 00 20       	mov    $0x20001dd0,%edi
    20000331:	e8 d2 0d 00 00       	call   20001108 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
    20000336:	48 8b 05 e3 1c 00 00 	mov    0x1ce3(%rip),%rax        # 20002020 <sum>
    2000033d:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000344:	de 1b 43 
    20000347:	48 f7 e2             	mul    %rdx
    2000034a:	48 89 d0             	mov    %rdx,%rax
    2000034d:	48 c1 e8 12          	shr    $0x12,%rax
    20000351:	48 89 c7             	mov    %rax,%rdi
    20000354:	e8 e5 0a 00 00       	call   20000e3e <UVM_Print_Int>
        /*Empty test ends here*/

        /*Empty system call test begins here*/
        sum=0;
    20000359:	48 c7 05 bc 1c 00 00 	movq   $0x0,0x1cbc(%rip)        # 20002020 <sum>
    20000360:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
    20000364:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
    2000036b:	00 
    2000036c:	eb 63                	jmp    200003d1 <main+0x163>
        {
            start=__UVM_X64_Read_TSC();
    2000036e:	e8 a8 fc ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000373:	48 89 05 8e 1c 00 00 	mov    %rax,0x1c8e(%rip)        # 20002008 <start>
            UVM_Svc(-1,-1,-1,-1);
    2000037a:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    20000381:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    20000388:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
    2000038f:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
    20000396:	e8 52 fd ff ff       	call   200000ed <UVM_Svc>
            end=__UVM_X64_Read_TSC();
    2000039b:	e8 7b fc ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200003a0:	48 89 05 71 1c 00 00 	mov    %rax,0x1c71(%rip)        # 20002018 <end>
            sum+=end-start;
    200003a7:	48 8b 05 6a 1c 00 00 	mov    0x1c6a(%rip),%rax        # 20002018 <end>
    200003ae:	48 8b 15 53 1c 00 00 	mov    0x1c53(%rip),%rdx        # 20002008 <start>
    200003b5:	48 29 d0             	sub    %rdx,%rax
    200003b8:	48 89 c1             	mov    %rax,%rcx
    200003bb:	48 8b 05 5e 1c 00 00 	mov    0x1c5e(%rip),%rax        # 20002020 <sum>
    200003c2:	48 01 c8             	add    %rcx,%rax
    200003c5:	48 89 05 54 1c 00 00 	mov    %rax,0x1c54(%rip)        # 20002020 <sum>
        for(Count=0;Count<1000000;Count++)
    200003cc:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    200003d1:	48 81 7d e8 3f 42 0f 	cmpq   $0xf423f,-0x18(%rbp)
    200003d8:	00 
    200003d9:	7e 93                	jle    2000036e <main+0x100>
        }
        UVM_LOG_S("\r\nEmpty system call takes clock cycles:");
    200003db:	bf f8 1d 00 20       	mov    $0x20001df8,%edi
    200003e0:	e8 23 0d 00 00       	call   20001108 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
    200003e5:	48 8b 05 34 1c 00 00 	mov    0x1c34(%rip),%rax        # 20002020 <sum>
    200003ec:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    200003f3:	de 1b 43 
    200003f6:	48 f7 e2             	mul    %rdx
    200003f9:	48 89 d0             	mov    %rdx,%rax
    200003fc:	48 c1 e8 12          	shr    $0x12,%rax
    20000400:	48 89 c7             	mov    %rax,%rdi
    20000403:	e8 36 0a 00 00       	call   20000e3e <UVM_Print_Int>
        /*Empty system call test ends here*/

        /*Now we begin to place kernel objects at this address,It must be a relative address*/
        Cur_Addr=0xFFFF800010000000ULL-0xFFFF800001600000ULL;
    20000408:	48 c7 45 e0 00 00 a0 	movq   $0xea00000,-0x20(%rbp)
    2000040f:	0e 
        UVM_Thd_Swt(TEST_THD1,0);
        UVM_LOG_S("\r\nExit THD1!");
        /*Thread switching test ends here#1#*/

        /*Signal send test begins here*/
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
    20000410:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000414:	48 89 c1             	mov    %rax,%rcx
    20000417:	ba 0c 00 00 00       	mov    $0xc,%edx
    2000041c:	be 00 80 05 00       	mov    $0x58000,%esi
    20000421:	bf 00 00 00 00       	mov    $0x0,%edi
    20000426:	e8 59 16 00 00       	call   20001a84 <UVM_Sig_Crt>
    2000042b:	48 85 c0             	test   %rax,%rax
    2000042e:	79 5c                	jns    2000048c <main+0x21e>
    20000430:	bf 20 1e 00 20       	mov    $0x20001e20,%edi
    20000435:	e8 ce 0c 00 00       	call   20001108 <UVM_Print_String>
    2000043a:	bf 51 1e 00 20       	mov    $0x20001e51,%edi
    2000043f:	e8 c4 0c 00 00       	call   20001108 <UVM_Print_String>
    20000444:	bf 5d 1e 00 20       	mov    $0x20001e5d,%edi
    20000449:	e8 ba 0c 00 00       	call   20001108 <UVM_Print_String>
    2000044e:	bf b5 00 00 00       	mov    $0xb5,%edi
    20000453:	e8 e6 09 00 00       	call   20000e3e <UVM_Print_Int>
    20000458:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    2000045d:	e8 a6 0c 00 00       	call   20001108 <UVM_Print_String>
    20000462:	bf 68 1e 00 20       	mov    $0x20001e68,%edi
    20000467:	e8 9c 0c 00 00       	call   20001108 <UVM_Print_String>
    2000046c:	bf 74 1e 00 20       	mov    $0x20001e74,%edi
    20000471:	e8 92 0c 00 00       	call   20001108 <UVM_Print_String>
    20000476:	bf 77 1e 00 20       	mov    $0x20001e77,%edi
    2000047b:	e8 88 0c 00 00       	call   20001108 <UVM_Print_String>
    20000480:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000485:	e8 7e 0c 00 00       	call   20001108 <UVM_Print_String>
    2000048a:	eb fe                	jmp    2000048a <main+0x21c>
        Cur_Addr+=UVM_SIG_SIZE;
    2000048c:	48 83 45 e0 20       	addq   $0x20,-0x20(%rbp)
        sum=0;
    20000491:	48 c7 05 84 1b 00 00 	movq   $0x0,0x1b84(%rip)        # 20002020 <sum>
    20000498:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
    2000049c:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
    200004a3:	00 
    200004a4:	eb 4c                	jmp    200004f2 <main+0x284>
        {
            start=__UVM_X64_Read_TSC();
    200004a6:	e8 70 fb ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200004ab:	48 89 05 56 1b 00 00 	mov    %rax,0x1b56(%rip)        # 20002008 <start>
            UVM_Sig_Snd(TEST_SIG1);
    200004b2:	bf 0c 00 00 00       	mov    $0xc,%edi
    200004b7:	e8 4e 16 00 00       	call   20001b0a <UVM_Sig_Snd>
            end=__UVM_X64_Read_TSC();
    200004bc:	e8 5a fb ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200004c1:	48 89 05 50 1b 00 00 	mov    %rax,0x1b50(%rip)        # 20002018 <end>
            sum+=end-start;
    200004c8:	48 8b 05 49 1b 00 00 	mov    0x1b49(%rip),%rax        # 20002018 <end>
    200004cf:	48 8b 15 32 1b 00 00 	mov    0x1b32(%rip),%rdx        # 20002008 <start>
    200004d6:	48 29 d0             	sub    %rdx,%rax
    200004d9:	48 89 c1             	mov    %rax,%rcx
    200004dc:	48 8b 05 3d 1b 00 00 	mov    0x1b3d(%rip),%rax        # 20002020 <sum>
    200004e3:	48 01 c8             	add    %rcx,%rax
    200004e6:	48 89 05 33 1b 00 00 	mov    %rax,0x1b33(%rip)        # 20002020 <sum>
        for(Count=0;Count<1000000;Count++)
    200004ed:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    200004f2:	48 81 7d e8 3f 42 0f 	cmpq   $0xf423f,-0x18(%rbp)
    200004f9:	00 
    200004fa:	7e aa                	jle    200004a6 <main+0x238>
        }
        UVM_LOG_S("\r\nSignal send takes clock cycles:");
    200004fc:	bf 80 1e 00 20       	mov    $0x20001e80,%edi
    20000501:	e8 02 0c 00 00       	call   20001108 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
    20000506:	48 8b 05 13 1b 00 00 	mov    0x1b13(%rip),%rax        # 20002020 <sum>
    2000050d:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000514:	de 1b 43 
    20000517:	48 f7 e2             	mul    %rdx
    2000051a:	48 89 d0             	mov    %rdx,%rax
    2000051d:	48 c1 e8 12          	shr    $0x12,%rax
    20000521:	48 89 c7             	mov    %rax,%rdi
    20000524:	e8 15 09 00 00       	call   20000e3e <UVM_Print_Int>
        /*Signal send test ends here*/


        /*Invocation stub test begins here*/
        /*Create test process capability table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROC_CAPTBL,Cur_Addr,16)>=0);
    20000529:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2000052d:	41 b8 10 00 00 00    	mov    $0x10,%r8d
    20000533:	48 89 c1             	mov    %rax,%rcx
    20000536:	ba 0d 00 00 00       	mov    $0xd,%edx
    2000053b:	be 00 80 05 00       	mov    $0x58000,%esi
    20000540:	bf 00 00 00 00       	mov    $0x0,%edi
    20000545:	e8 1d 0c 00 00       	call   20001167 <UVM_Captbl_Crt>
    2000054a:	48 85 c0             	test   %rax,%rax
    2000054d:	79 5c                	jns    200005ab <main+0x33d>
    2000054f:	bf 20 1e 00 20       	mov    $0x20001e20,%edi
    20000554:	e8 af 0b 00 00       	call   20001108 <UVM_Print_String>
    20000559:	bf 51 1e 00 20       	mov    $0x20001e51,%edi
    2000055e:	e8 a5 0b 00 00       	call   20001108 <UVM_Print_String>
    20000563:	bf 5d 1e 00 20       	mov    $0x20001e5d,%edi
    20000568:	e8 9b 0b 00 00       	call   20001108 <UVM_Print_String>
    2000056d:	bf c6 00 00 00       	mov    $0xc6,%edi
    20000572:	e8 c7 08 00 00       	call   20000e3e <UVM_Print_Int>
    20000577:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    2000057c:	e8 87 0b 00 00       	call   20001108 <UVM_Print_String>
    20000581:	bf 68 1e 00 20       	mov    $0x20001e68,%edi
    20000586:	e8 7d 0b 00 00       	call   20001108 <UVM_Print_String>
    2000058b:	bf 74 1e 00 20       	mov    $0x20001e74,%edi
    20000590:	e8 73 0b 00 00       	call   20001108 <UVM_Print_String>
    20000595:	bf 77 1e 00 20       	mov    $0x20001e77,%edi
    2000059a:	e8 69 0b 00 00       	call   20001108 <UVM_Print_String>
    2000059f:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    200005a4:	e8 5f 0b 00 00       	call   20001108 <UVM_Print_String>
    200005a9:	eb fe                	jmp    200005a9 <main+0x33b>
        Cur_Addr+=UVM_CAPTBL_SIZE(16);
    200005ab:	48 81 45 e0 00 04 00 	addq   $0x400,-0x20(%rbp)
    200005b2:	00 
        /*Create test process page table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PGT,Cur_Addr,1+16+8192)>=0);
    200005b3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200005b7:	41 b8 11 20 00 00    	mov    $0x2011,%r8d
    200005bd:	48 89 c1             	mov    %rax,%rcx
    200005c0:	ba 0e 00 00 00       	mov    $0xe,%edx
    200005c5:	be 00 80 05 00       	mov    $0x58000,%esi
    200005ca:	bf 00 00 00 00       	mov    $0x0,%edi
    200005cf:	e8 93 0b 00 00       	call   20001167 <UVM_Captbl_Crt>
    200005d4:	48 85 c0             	test   %rax,%rax
    200005d7:	79 5c                	jns    20000635 <main+0x3c7>
    200005d9:	bf 20 1e 00 20       	mov    $0x20001e20,%edi
    200005de:	e8 25 0b 00 00       	call   20001108 <UVM_Print_String>
    200005e3:	bf 51 1e 00 20       	mov    $0x20001e51,%edi
    200005e8:	e8 1b 0b 00 00       	call   20001108 <UVM_Print_String>
    200005ed:	bf 5d 1e 00 20       	mov    $0x20001e5d,%edi
    200005f2:	e8 11 0b 00 00       	call   20001108 <UVM_Print_String>
    200005f7:	bf c9 00 00 00       	mov    $0xc9,%edi
    200005fc:	e8 3d 08 00 00       	call   20000e3e <UVM_Print_Int>
    20000601:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000606:	e8 fd 0a 00 00       	call   20001108 <UVM_Print_String>
    2000060b:	bf 68 1e 00 20       	mov    $0x20001e68,%edi
    20000610:	e8 f3 0a 00 00       	call   20001108 <UVM_Print_String>
    20000615:	bf 74 1e 00 20       	mov    $0x20001e74,%edi
    2000061a:	e8 e9 0a 00 00       	call   20001108 <UVM_Print_String>
    2000061f:	bf 77 1e 00 20       	mov    $0x20001e77,%edi
    20000624:	e8 df 0a 00 00       	call   20001108 <UVM_Print_String>
    20000629:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    2000062e:	e8 d5 0a 00 00       	call   20001108 <UVM_Print_String>
    20000633:	eb fe                	jmp    20000633 <main+0x3c5>
        Cur_Addr+=UVM_CAPTBL_SIZE(1+16+8192);
    20000635:	48 81 45 e0 40 04 08 	addq   $0x80440,-0x20(%rbp)
    2000063c:	00 
        /*Create test process PML4*/
        Cur_Addr+=UVM_ROUND_UP(Cur_Addr,12);
    2000063d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000641:	48 05 ff 0f 00 00    	add    $0xfff,%rax
    20000647:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
    2000064d:	48 01 45 e0          	add    %rax,-0x20(%rbp)
        UVM_ASSERT(UVM_Pgtbl_Crt(TEST_PROCESS_PGT,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PML4,Cur_Addr,0,1U,RME_PGT_SIZE_512G,RME_PGT_NUM_512)>=0);
    20000651:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000655:	6a 09                	push   $0x9
    20000657:	6a 27                	push   $0x27
    20000659:	41 b9 01 00 00 00    	mov    $0x1,%r9d
    2000065f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    20000665:	48 89 c1             	mov    %rax,%rcx
    20000668:	ba 00 00 00 00       	mov    $0x0,%edx
    2000066d:	be 00 80 05 00       	mov    $0x58000,%esi
    20000672:	bf 0e 00 00 00       	mov    $0xe,%edi
    20000677:	e8 65 0e 00 00       	call   200014e1 <UVM_Pgtbl_Crt>
    2000067c:	48 83 c4 10          	add    $0x10,%rsp
    20000680:	48 85 c0             	test   %rax,%rax
    20000683:	79 5c                	jns    200006e1 <main+0x473>
    20000685:	bf 20 1e 00 20       	mov    $0x20001e20,%edi
    2000068a:	e8 79 0a 00 00       	call   20001108 <UVM_Print_String>
    2000068f:	bf 51 1e 00 20       	mov    $0x20001e51,%edi
    20000694:	e8 6f 0a 00 00       	call   20001108 <UVM_Print_String>
    20000699:	bf 5d 1e 00 20       	mov    $0x20001e5d,%edi
    2000069e:	e8 65 0a 00 00       	call   20001108 <UVM_Print_String>
    200006a3:	bf cd 00 00 00       	mov    $0xcd,%edi
    200006a8:	e8 91 07 00 00       	call   20000e3e <UVM_Print_Int>
    200006ad:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    200006b2:	e8 51 0a 00 00       	call   20001108 <UVM_Print_String>
    200006b7:	bf 68 1e 00 20       	mov    $0x20001e68,%edi
    200006bc:	e8 47 0a 00 00       	call   20001108 <UVM_Print_String>
    200006c1:	bf 74 1e 00 20       	mov    $0x20001e74,%edi
    200006c6:	e8 3d 0a 00 00       	call   20001108 <UVM_Print_String>
    200006cb:	bf 77 1e 00 20       	mov    $0x20001e77,%edi
    200006d0:	e8 33 0a 00 00       	call   20001108 <UVM_Print_String>
    200006d5:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    200006da:	e8 29 0a 00 00       	call   20001108 <UVM_Print_String>
    200006df:	eb fe                	jmp    200006df <main+0x471>
        Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
    200006e1:	48 81 45 e0 00 00 04 	addq   $0x40000,-0x20(%rbp)
    200006e8:	00 
        Cur_Addr+=UVM_ROUND_UP(Cur_Addr,12);
    200006e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200006ed:	48 05 ff 0f 00 00    	add    $0xfff,%rax
    200006f3:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
    200006f9:	48 01 45 e0          	add    %rax,-0x20(%rbp)
        /* Create 16 PDPs*/
        for(Count=0;Count<16;Count++)
    200006fd:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
    20000704:	00 
    20000705:	e9 28 01 00 00       	jmp    20000832 <main+0x5c4>
        {
            UVM_ASSERT(UVM_Pgtbl_Crt(TEST_PROCESS_PGT, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), RME_TEST_PDP(Count),
    2000070a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2000070e:	48 8d 50 01          	lea    0x1(%rax),%rdx
    20000712:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000716:	6a 09                	push   $0x9
    20000718:	6a 1e                	push   $0x1e
    2000071a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
    20000720:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    20000726:	48 89 c1             	mov    %rax,%rcx
    20000729:	be 00 80 05 00       	mov    $0x58000,%esi
    2000072e:	bf 0e 00 00 00       	mov    $0xe,%edi
    20000733:	e8 a9 0d 00 00       	call   200014e1 <UVM_Pgtbl_Crt>
    20000738:	48 83 c4 10          	add    $0x10,%rsp
    2000073c:	48 85 c0             	test   %rax,%rax
    2000073f:	79 5c                	jns    2000079d <main+0x52f>
    20000741:	bf 20 1e 00 20       	mov    $0x20001e20,%edi
    20000746:	e8 bd 09 00 00       	call   20001108 <UVM_Print_String>
    2000074b:	bf 51 1e 00 20       	mov    $0x20001e51,%edi
    20000750:	e8 b3 09 00 00       	call   20001108 <UVM_Print_String>
    20000755:	bf 5d 1e 00 20       	mov    $0x20001e5d,%edi
    2000075a:	e8 a9 09 00 00       	call   20001108 <UVM_Print_String>
    2000075f:	bf d3 00 00 00       	mov    $0xd3,%edi
    20000764:	e8 d5 06 00 00       	call   20000e3e <UVM_Print_Int>
    20000769:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    2000076e:	e8 95 09 00 00       	call   20001108 <UVM_Print_String>
    20000773:	bf 68 1e 00 20       	mov    $0x20001e68,%edi
    20000778:	e8 8b 09 00 00       	call   20001108 <UVM_Print_String>
    2000077d:	bf 74 1e 00 20       	mov    $0x20001e74,%edi
    20000782:	e8 81 09 00 00       	call   20001108 <UVM_Print_String>
    20000787:	bf 77 1e 00 20       	mov    $0x20001e77,%edi
    2000078c:	e8 77 09 00 00       	call   20001108 <UVM_Print_String>
    20000791:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000796:	e8 6d 09 00 00       	call   20001108 <UVM_Print_String>
    2000079b:	eb fe                	jmp    2000079b <main+0x52d>
                                           Cur_Addr, 0, 0U, RME_PGT_SIZE_1G, RME_PGT_NUM_512)>=0);
            Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
    2000079d:	48 81 45 e0 00 00 04 	addq   $0x40000,-0x20(%rbp)
    200007a4:	00 
            UVM_ASSERT(UVM_Pgtbl_Con(UVM_CAPID(TEST_PROCESS_PGT,TEST_PROCESS_PML4),Count,
    200007a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200007a9:	48 83 c0 01          	add    $0x1,%rax
    200007ad:	48 0d 00 80 0e 00    	or     $0xe8000,%rax
    200007b3:	48 89 c2             	mov    %rax,%rdx
    200007b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200007ba:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    200007bf:	48 89 c6             	mov    %rax,%rsi
    200007c2:	bf 00 80 0e 00       	mov    $0xe8000,%edi
    200007c7:	e8 8c 0e 00 00       	call   20001658 <UVM_Pgtbl_Con>
    200007cc:	48 85 c0             	test   %rax,%rax
    200007cf:	79 5c                	jns    2000082d <main+0x5bf>
    200007d1:	bf 20 1e 00 20       	mov    $0x20001e20,%edi
    200007d6:	e8 2d 09 00 00       	call   20001108 <UVM_Print_String>
    200007db:	bf 51 1e 00 20       	mov    $0x20001e51,%edi
    200007e0:	e8 23 09 00 00       	call   20001108 <UVM_Print_String>
    200007e5:	bf 5d 1e 00 20       	mov    $0x20001e5d,%edi
    200007ea:	e8 19 09 00 00       	call   20001108 <UVM_Print_String>
    200007ef:	bf d6 00 00 00       	mov    $0xd6,%edi
    200007f4:	e8 45 06 00 00       	call   20000e3e <UVM_Print_Int>
    200007f9:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    200007fe:	e8 05 09 00 00       	call   20001108 <UVM_Print_String>
    20000803:	bf 68 1e 00 20       	mov    $0x20001e68,%edi
    20000808:	e8 fb 08 00 00       	call   20001108 <UVM_Print_String>
    2000080d:	bf 74 1e 00 20       	mov    $0x20001e74,%edi
    20000812:	e8 f1 08 00 00       	call   20001108 <UVM_Print_String>
    20000817:	bf 77 1e 00 20       	mov    $0x20001e77,%edi
    2000081c:	e8 e7 08 00 00       	call   20001108 <UVM_Print_String>
    20000821:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000826:	e8 dd 08 00 00       	call   20001108 <UVM_Print_String>
    2000082b:	eb fe                	jmp    2000082b <main+0x5bd>
        for(Count=0;Count<16;Count++)
    2000082d:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    20000832:	48 83 7d e8 0f       	cmpq   $0xf,-0x18(%rbp)
    20000837:	0f 8e cd fe ff ff    	jle    2000070a <main+0x49c>
                                                UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDP(Count)),RME_PGT_ALL_PERM)>=0);
        }

        /* Create 8192 PDEs*/
        for(Count=0;Count<8192;Count++)
    2000083d:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
    20000844:	00 
    20000845:	e9 3d 01 00 00       	jmp    20000987 <main+0x719>
        {
            UVM_ASSERT(UVM_Pgtbl_Crt(TEST_PROCESS_PGT, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), RME_TEST_PDE(Count),
    2000084a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2000084e:	48 8d 50 11          	lea    0x11(%rax),%rdx
    20000852:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000856:	6a 09                	push   $0x9
    20000858:	6a 15                	push   $0x15
    2000085a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
    20000860:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    20000866:	48 89 c1             	mov    %rax,%rcx
    20000869:	be 00 80 05 00       	mov    $0x58000,%esi
    2000086e:	bf 0e 00 00 00       	mov    $0xe,%edi
    20000873:	e8 69 0c 00 00       	call   200014e1 <UVM_Pgtbl_Crt>
    20000878:	48 83 c4 10          	add    $0x10,%rsp
    2000087c:	48 85 c0             	test   %rax,%rax
    2000087f:	79 5c                	jns    200008dd <main+0x66f>
    20000881:	bf 20 1e 00 20       	mov    $0x20001e20,%edi
    20000886:	e8 7d 08 00 00       	call   20001108 <UVM_Print_String>
    2000088b:	bf 51 1e 00 20       	mov    $0x20001e51,%edi
    20000890:	e8 73 08 00 00       	call   20001108 <UVM_Print_String>
    20000895:	bf 5d 1e 00 20       	mov    $0x20001e5d,%edi
    2000089a:	e8 69 08 00 00       	call   20001108 <UVM_Print_String>
    2000089f:	bf dd 00 00 00       	mov    $0xdd,%edi
    200008a4:	e8 95 05 00 00       	call   20000e3e <UVM_Print_Int>
    200008a9:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    200008ae:	e8 55 08 00 00       	call   20001108 <UVM_Print_String>
    200008b3:	bf 68 1e 00 20       	mov    $0x20001e68,%edi
    200008b8:	e8 4b 08 00 00       	call   20001108 <UVM_Print_String>
    200008bd:	bf 74 1e 00 20       	mov    $0x20001e74,%edi
    200008c2:	e8 41 08 00 00       	call   20001108 <UVM_Print_String>
    200008c7:	bf 77 1e 00 20       	mov    $0x20001e77,%edi
    200008cc:	e8 37 08 00 00       	call   20001108 <UVM_Print_String>
    200008d1:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    200008d6:	e8 2d 08 00 00       	call   20001108 <UVM_Print_String>
    200008db:	eb fe                	jmp    200008db <main+0x66d>
                                           Cur_Addr, 0, 0U,  RME_PGT_SIZE_2M, RME_PGT_NUM_512)>=0);
            Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
    200008dd:	48 81 45 e0 00 00 04 	addq   $0x40000,-0x20(%rbp)
    200008e4:	00 
            UVM_ASSERT(UVM_Pgtbl_Con(UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDP(Count>>9)),Count&0x1FF,
    200008e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200008e9:	48 83 c0 11          	add    $0x11,%rax
    200008ed:	48 0d 00 80 0e 00    	or     $0xe8000,%rax
    200008f3:	48 89 c2             	mov    %rax,%rdx
    200008f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200008fa:	25 ff 01 00 00       	and    $0x1ff,%eax
    200008ff:	48 89 c6             	mov    %rax,%rsi
    20000902:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000906:	48 c1 f8 09          	sar    $0x9,%rax
    2000090a:	48 83 c0 01          	add    $0x1,%rax
    2000090e:	48 0d 00 80 0e 00    	or     $0xe8000,%rax
    20000914:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    20000919:	48 89 c7             	mov    %rax,%rdi
    2000091c:	e8 37 0d 00 00       	call   20001658 <UVM_Pgtbl_Con>
    20000921:	48 85 c0             	test   %rax,%rax
    20000924:	79 5c                	jns    20000982 <main+0x714>
    20000926:	bf 20 1e 00 20       	mov    $0x20001e20,%edi
    2000092b:	e8 d8 07 00 00       	call   20001108 <UVM_Print_String>
    20000930:	bf 51 1e 00 20       	mov    $0x20001e51,%edi
    20000935:	e8 ce 07 00 00       	call   20001108 <UVM_Print_String>
    2000093a:	bf 5d 1e 00 20       	mov    $0x20001e5d,%edi
    2000093f:	e8 c4 07 00 00       	call   20001108 <UVM_Print_String>
    20000944:	bf e0 00 00 00       	mov    $0xe0,%edi
    20000949:	e8 f0 04 00 00       	call   20000e3e <UVM_Print_Int>
    2000094e:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000953:	e8 b0 07 00 00       	call   20001108 <UVM_Print_String>
    20000958:	bf 68 1e 00 20       	mov    $0x20001e68,%edi
    2000095d:	e8 a6 07 00 00       	call   20001108 <UVM_Print_String>
    20000962:	bf 74 1e 00 20       	mov    $0x20001e74,%edi
    20000967:	e8 9c 07 00 00       	call   20001108 <UVM_Print_String>
    2000096c:	bf 77 1e 00 20       	mov    $0x20001e77,%edi
    20000971:	e8 92 07 00 00       	call   20001108 <UVM_Print_String>
    20000976:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    2000097b:	e8 88 07 00 00       	call   20001108 <UVM_Print_String>
    20000980:	eb fe                	jmp    20000980 <main+0x712>
        for(Count=0;Count<8192;Count++)
    20000982:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    20000987:	48 81 7d e8 ff 1f 00 	cmpq   $0x1fff,-0x18(%rbp)
    2000098e:	00 
    2000098f:	0f 8e b5 fe ff ff    	jle    2000084a <main+0x5dc>
                                       UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDE(Count)),RME_PGT_ALL_PERM)>=0);
        }
        /*Add pages to PDEs*/
        for (Count1=0;Count1<8192;Count1++)
    20000995:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    2000099c:	00 
    2000099d:	e9 ca 00 00 00       	jmp    20000a6c <main+0x7fe>
        {
            for (Count2=0;Count2<512;Count2++)
    200009a2:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    200009a9:	00 
    200009aa:	e9 aa 00 00 00       	jmp    20000a59 <main+0x7eb>
            {
                UVM_ASSERT(UVM_Pgtbl_Add(UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDE(Count1)),Count2,0,
    200009af:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    200009b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200009b7:	48 83 c0 11          	add    $0x11,%rax
    200009bb:	48 0d 00 80 01 00    	or     $0x18000,%rax
    200009c1:	48 89 c2             	mov    %rax,%rdx
    200009c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200009c8:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    200009cc:	48 83 c1 11          	add    $0x11,%rcx
    200009d0:	48 81 c9 00 80 0e 00 	or     $0xe8000,%rcx
    200009d7:	48 89 cf             	mov    %rcx,%rdi
    200009da:	41 b9 00 00 00 00    	mov    $0x0,%r9d
    200009e0:	49 89 f0             	mov    %rsi,%r8
    200009e3:	48 89 d1             	mov    %rdx,%rcx
    200009e6:	ba 00 00 00 00       	mov    $0x0,%edx
    200009eb:	48 89 c6             	mov    %rax,%rsi
    200009ee:	e8 b9 0b 00 00       	call   200015ac <UVM_Pgtbl_Add>
    200009f3:	48 85 c0             	test   %rax,%rax
    200009f6:	79 5c                	jns    20000a54 <main+0x7e6>
    200009f8:	bf 20 1e 00 20       	mov    $0x20001e20,%edi
    200009fd:	e8 06 07 00 00       	call   20001108 <UVM_Print_String>
    20000a02:	bf 51 1e 00 20       	mov    $0x20001e51,%edi
    20000a07:	e8 fc 06 00 00       	call   20001108 <UVM_Print_String>
    20000a0c:	bf 5d 1e 00 20       	mov    $0x20001e5d,%edi
    20000a11:	e8 f2 06 00 00       	call   20001108 <UVM_Print_String>
    20000a16:	bf e8 00 00 00       	mov    $0xe8,%edi
    20000a1b:	e8 1e 04 00 00       	call   20000e3e <UVM_Print_Int>
    20000a20:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000a25:	e8 de 06 00 00       	call   20001108 <UVM_Print_String>
    20000a2a:	bf 68 1e 00 20       	mov    $0x20001e68,%edi
    20000a2f:	e8 d4 06 00 00       	call   20001108 <UVM_Print_String>
    20000a34:	bf 74 1e 00 20       	mov    $0x20001e74,%edi
    20000a39:	e8 ca 06 00 00       	call   20001108 <UVM_Print_String>
    20000a3e:	bf 77 1e 00 20       	mov    $0x20001e77,%edi
    20000a43:	e8 c0 06 00 00       	call   20001108 <UVM_Print_String>
    20000a48:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000a4d:	e8 b6 06 00 00       	call   20001108 <UVM_Print_String>
    20000a52:	eb fe                	jmp    20000a52 <main+0x7e4>
            for (Count2=0;Count2<512;Count2++)
    20000a54:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    20000a59:	48 81 7d f8 ff 01 00 	cmpq   $0x1ff,-0x8(%rbp)
    20000a60:	00 
    20000a61:	0f 8e 48 ff ff ff    	jle    200009af <main+0x741>
        for (Count1=0;Count1<8192;Count1++)
    20000a67:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    20000a6c:	48 81 7d f0 ff 1f 00 	cmpq   $0x1fff,-0x10(%rbp)
    20000a73:	00 
    20000a74:	0f 8e 28 ff ff ff    	jle    200009a2 <main+0x734>
                                    UVM_CAPID(UVM_BOOT_TBL_PGTBL,RME_TEST_PDE(Count1)),Count2,0)>=0);
            }
        }
        /*Now we create the test process*/
        UVM_ASSERT(UVM_Proc_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS,UVM_BOOT_CAPTBL,
    20000a7a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000a7e:	49 89 c1             	mov    %rax,%r9
    20000a81:	41 b8 00 80 0e 00    	mov    $0xe8000,%r8d
    20000a87:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000a8c:	ba 0f 00 00 00       	mov    $0xf,%edx
    20000a91:	be 00 80 05 00       	mov    $0x58000,%esi
    20000a96:	bf 00 00 00 00       	mov    $0x0,%edi
    20000a9b:	e8 45 0c 00 00       	call   200016e5 <UVM_Proc_Crt>
    20000aa0:	48 85 c0             	test   %rax,%rax
    20000aa3:	79 5c                	jns    20000b01 <main+0x893>
    20000aa5:	bf 20 1e 00 20       	mov    $0x20001e20,%edi
    20000aaa:	e8 59 06 00 00       	call   20001108 <UVM_Print_String>
    20000aaf:	bf 51 1e 00 20       	mov    $0x20001e51,%edi
    20000ab4:	e8 4f 06 00 00       	call   20001108 <UVM_Print_String>
    20000ab9:	bf 5d 1e 00 20       	mov    $0x20001e5d,%edi
    20000abe:	e8 45 06 00 00       	call   20001108 <UVM_Print_String>
    20000ac3:	bf ed 00 00 00       	mov    $0xed,%edi
    20000ac8:	e8 71 03 00 00       	call   20000e3e <UVM_Print_Int>
    20000acd:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000ad2:	e8 31 06 00 00       	call   20001108 <UVM_Print_String>
    20000ad7:	bf 68 1e 00 20       	mov    $0x20001e68,%edi
    20000adc:	e8 27 06 00 00       	call   20001108 <UVM_Print_String>
    20000ae1:	bf 74 1e 00 20       	mov    $0x20001e74,%edi
    20000ae6:	e8 1d 06 00 00       	call   20001108 <UVM_Print_String>
    20000aeb:	bf 77 1e 00 20       	mov    $0x20001e77,%edi
    20000af0:	e8 13 06 00 00       	call   20001108 <UVM_Print_String>
    20000af5:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000afa:	e8 09 06 00 00       	call   20001108 <UVM_Print_String>
    20000aff:	eb fe                	jmp    20000aff <main+0x891>
                                                UVM_CAPID(TEST_PROCESS_PGT,TEST_PROCESS_PML4),Cur_Addr)>=0);
        Cur_Addr+=UVM_PROC_SIZE;
    20000b01:	48 83 45 e0 20       	addq   $0x20,-0x20(%rbp)

        /*create the test invacation stub */
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, UVM_BOOT_INIT_PROC, Cur_Addr)>=0);
    20000b06:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000b0a:	49 89 c0             	mov    %rax,%r8
    20000b0d:	b9 02 00 00 00       	mov    $0x2,%ecx
    20000b12:	ba 0b 00 00 00       	mov    $0xb,%edx
    20000b17:	be 00 80 05 00       	mov    $0x58000,%esi
    20000b1c:	bf 00 00 00 00       	mov    $0x0,%edi
    20000b21:	e8 51 10 00 00       	call   20001b77 <UVM_Inv_Crt>
    20000b26:	48 85 c0             	test   %rax,%rax
    20000b29:	79 5c                	jns    20000b87 <main+0x919>
    20000b2b:	bf 20 1e 00 20       	mov    $0x20001e20,%edi
    20000b30:	e8 d3 05 00 00       	call   20001108 <UVM_Print_String>
    20000b35:	bf 51 1e 00 20       	mov    $0x20001e51,%edi
    20000b3a:	e8 c9 05 00 00       	call   20001108 <UVM_Print_String>
    20000b3f:	bf 5d 1e 00 20       	mov    $0x20001e5d,%edi
    20000b44:	e8 bf 05 00 00       	call   20001108 <UVM_Print_String>
    20000b49:	bf f2 00 00 00       	mov    $0xf2,%edi
    20000b4e:	e8 eb 02 00 00       	call   20000e3e <UVM_Print_Int>
    20000b53:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000b58:	e8 ab 05 00 00       	call   20001108 <UVM_Print_String>
    20000b5d:	bf 68 1e 00 20       	mov    $0x20001e68,%edi
    20000b62:	e8 a1 05 00 00       	call   20001108 <UVM_Print_String>
    20000b67:	bf 74 1e 00 20       	mov    $0x20001e74,%edi
    20000b6c:	e8 97 05 00 00       	call   20001108 <UVM_Print_String>
    20000b71:	bf 77 1e 00 20       	mov    $0x20001e77,%edi
    20000b76:	e8 8d 05 00 00       	call   20001108 <UVM_Print_String>
    20000b7b:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000b80:	e8 83 05 00 00       	call   20001108 <UVM_Print_String>
    20000b85:	eb fe                	jmp    20000b85 <main+0x917>
        UVM_LOG_S("\r\nSuccess!!!!");
    20000b87:	bf a2 1e 00 20       	mov    $0x20001ea2,%edi
    20000b8c:	e8 77 05 00 00       	call   20001108 <UVM_Print_String>
        Cur_Addr+=UVM_INV_SIZE;
    20000b91:	48 83 45 e0 50       	addq   $0x50,-0x20(%rbp)
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1, TEST_INV1_FUNC,TEST_INV_STACK,0)>=0);
    20000b96:	48 8d 85 e0 bf ff ff 	lea    -0x4020(%rbp),%rax
    20000b9d:	be 43 02 00 20       	mov    $0x20000243,%esi
    20000ba2:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000ba7:	48 89 c2             	mov    %rax,%rdx
    20000baa:	bf 0b 00 00 00       	mov    $0xb,%edi
    20000baf:	e8 63 10 00 00       	call   20001c17 <UVM_Inv_Set>
    20000bb4:	48 85 c0             	test   %rax,%rax
    20000bb7:	79 5c                	jns    20000c15 <main+0x9a7>
    20000bb9:	bf 20 1e 00 20       	mov    $0x20001e20,%edi
    20000bbe:	e8 45 05 00 00       	call   20001108 <UVM_Print_String>
    20000bc3:	bf 51 1e 00 20       	mov    $0x20001e51,%edi
    20000bc8:	e8 3b 05 00 00       	call   20001108 <UVM_Print_String>
    20000bcd:	bf 5d 1e 00 20       	mov    $0x20001e5d,%edi
    20000bd2:	e8 31 05 00 00       	call   20001108 <UVM_Print_String>
    20000bd7:	bf f5 00 00 00       	mov    $0xf5,%edi
    20000bdc:	e8 5d 02 00 00       	call   20000e3e <UVM_Print_Int>
    20000be1:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000be6:	e8 1d 05 00 00       	call   20001108 <UVM_Print_String>
    20000beb:	bf 68 1e 00 20       	mov    $0x20001e68,%edi
    20000bf0:	e8 13 05 00 00       	call   20001108 <UVM_Print_String>
    20000bf5:	bf 74 1e 00 20       	mov    $0x20001e74,%edi
    20000bfa:	e8 09 05 00 00       	call   20001108 <UVM_Print_String>
    20000bff:	bf 77 1e 00 20       	mov    $0x20001e77,%edi
    20000c04:	e8 ff 04 00 00       	call   20001108 <UVM_Print_String>
    20000c09:	bf 65 1e 00 20       	mov    $0x20001e65,%edi
    20000c0e:	e8 f5 04 00 00       	call   20001108 <UVM_Print_String>
    20000c13:	eb fe                	jmp    20000c13 <main+0x9a5>
        UVM_LOG_S("\r\nSuccess!!!!");
    20000c15:	bf a2 1e 00 20       	mov    $0x20001ea2,%edi
    20000c1a:	e8 e9 04 00 00       	call   20001108 <UVM_Print_String>
        sum=0;
    20000c1f:	48 c7 05 f6 13 00 00 	movq   $0x0,0x13f6(%rip)        # 20002020 <sum>
    20000c26:	00 00 00 00 
        sumin=0;
    20000c2a:	48 c7 05 f3 13 00 00 	movq   $0x0,0x13f3(%rip)        # 20002028 <sumin>
    20000c31:	00 00 00 00 
        sumout=0;
    20000c35:	48 c7 05 f0 13 00 00 	movq   $0x0,0x13f0(%rip)        # 20002030 <sumout>
    20000c3c:	00 00 00 00 
        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
    20000c40:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
    20000c47:	00 
    20000c48:	e9 b6 00 00 00       	jmp    20000d03 <main+0xa95>
        {
            start=__UVM_X64_Read_TSC();
    20000c4d:	e8 c9 f3 ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000c52:	48 89 05 af 13 00 00 	mov    %rax,0x13af(%rip)        # 20002008 <start>
            UVM_LOG_S("\r\nCount:");
    20000c59:	bf b0 1e 00 20       	mov    $0x20001eb0,%edi
    20000c5e:	e8 a5 04 00 00       	call   20001108 <UVM_Print_String>
            UVM_LOG_I(Count);
    20000c63:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000c67:	48 89 c7             	mov    %rax,%rdi
    20000c6a:	e8 cf 01 00 00       	call   20000e3e <UVM_Print_Int>
            UVM_Inv_Act(TEST_INV1,0,0);
    20000c6f:	ba 00 00 00 00       	mov    $0x0,%edx
    20000c74:	be 00 00 00 00       	mov    $0x0,%esi
    20000c79:	bf 0b 00 00 00       	mov    $0xb,%edi
    20000c7e:	e8 d6 f3 ff ff       	call   20000059 <UVM_Inv_Act>
            end=__UVM_X64_Read_TSC();
    20000c83:	e8 93 f3 ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000c88:	48 89 05 89 13 00 00 	mov    %rax,0x1389(%rip)        # 20002018 <end>
            sum+=end-start;
    20000c8f:	48 8b 05 82 13 00 00 	mov    0x1382(%rip),%rax        # 20002018 <end>
    20000c96:	48 8b 15 6b 13 00 00 	mov    0x136b(%rip),%rdx        # 20002008 <start>
    20000c9d:	48 29 d0             	sub    %rdx,%rax
    20000ca0:	48 89 c1             	mov    %rax,%rcx
    20000ca3:	48 8b 05 76 13 00 00 	mov    0x1376(%rip),%rax        # 20002020 <sum>
    20000caa:	48 01 c8             	add    %rcx,%rax
    20000cad:	48 89 05 6c 13 00 00 	mov    %rax,0x136c(%rip)        # 20002020 <sum>
            sumin+=middle-start;
    20000cb4:	48 8b 05 55 13 00 00 	mov    0x1355(%rip),%rax        # 20002010 <middle>
    20000cbb:	48 8b 15 46 13 00 00 	mov    0x1346(%rip),%rdx        # 20002008 <start>
    20000cc2:	48 29 d0             	sub    %rdx,%rax
    20000cc5:	48 89 c1             	mov    %rax,%rcx
    20000cc8:	48 8b 05 59 13 00 00 	mov    0x1359(%rip),%rax        # 20002028 <sumin>
    20000ccf:	48 01 c8             	add    %rcx,%rax
    20000cd2:	48 89 05 4f 13 00 00 	mov    %rax,0x134f(%rip)        # 20002028 <sumin>
            sumout+=end-middle;
    20000cd9:	48 8b 05 38 13 00 00 	mov    0x1338(%rip),%rax        # 20002018 <end>
    20000ce0:	48 8b 15 29 13 00 00 	mov    0x1329(%rip),%rdx        # 20002010 <middle>
    20000ce7:	48 29 d0             	sub    %rdx,%rax
    20000cea:	48 89 c1             	mov    %rax,%rcx
    20000ced:	48 8b 05 3c 13 00 00 	mov    0x133c(%rip),%rax        # 20002030 <sumout>
    20000cf4:	48 01 c8             	add    %rcx,%rax
    20000cf7:	48 89 05 32 13 00 00 	mov    %rax,0x1332(%rip)        # 20002030 <sumout>
        for(Count=0;Count<1000000;Count++)
    20000cfe:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
    20000d03:	48 81 7d e8 3f 42 0f 	cmpq   $0xf423f,-0x18(%rbp)
    20000d0a:	00 
    20000d0b:	0f 8e 3c ff ff ff    	jle    20000c4d <main+0x9df>
        }
        UVM_LOG_S("\r\ninv");
    20000d11:	bf b9 1e 00 20       	mov    $0x20001eb9,%edi
    20000d16:	e8 ed 03 00 00       	call   20001108 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
    20000d1b:	48 8b 05 fe 12 00 00 	mov    0x12fe(%rip),%rax        # 20002020 <sum>
    20000d22:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000d29:	de 1b 43 
    20000d2c:	48 f7 e2             	mul    %rdx
    20000d2f:	48 89 d0             	mov    %rdx,%rax
    20000d32:	48 c1 e8 12          	shr    $0x12,%rax
    20000d36:	48 89 c7             	mov    %rax,%rdi
    20000d39:	e8 00 01 00 00       	call   20000e3e <UVM_Print_Int>
        UVM_LOG_S("\r\nin");
    20000d3e:	bf bf 1e 00 20       	mov    $0x20001ebf,%edi
    20000d43:	e8 c0 03 00 00       	call   20001108 <UVM_Print_String>
        UVM_LOG_I(sumin/1000000);
    20000d48:	48 8b 05 d9 12 00 00 	mov    0x12d9(%rip),%rax        # 20002028 <sumin>
    20000d4f:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000d56:	de 1b 43 
    20000d59:	48 f7 e2             	mul    %rdx
    20000d5c:	48 89 d0             	mov    %rdx,%rax
    20000d5f:	48 c1 e8 12          	shr    $0x12,%rax
    20000d63:	48 89 c7             	mov    %rax,%rdi
    20000d66:	e8 d3 00 00 00       	call   20000e3e <UVM_Print_Int>
        UVM_LOG_S("\r\nout");
    20000d6b:	bf c4 1e 00 20       	mov    $0x20001ec4,%edi
    20000d70:	e8 93 03 00 00       	call   20001108 <UVM_Print_String>
        UVM_LOG_I(sumout/1000000);
    20000d75:	48 8b 05 b4 12 00 00 	mov    0x12b4(%rip),%rax        # 20002030 <sumout>
    20000d7c:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000d83:	de 1b 43 
    20000d86:	48 f7 e2             	mul    %rdx
    20000d89:	48 89 d0             	mov    %rdx,%rax
    20000d8c:	48 c1 e8 12          	shr    $0x12,%rax
    20000d90:	48 89 c7             	mov    %rax,%rdi
    20000d93:	e8 a6 00 00 00       	call   20000e3e <UVM_Print_Int>

        /*Invocation stub test ends here*/
        while (1){}
    20000d98:	eb fe                	jmp    20000d98 <main+0xb2a>
        UVM_Thd_Swt(TEST_THD1,0);

        /*Cross-process thread switching test ends here*/
        while (1);/*Idle*/
    }
}
    20000d9a:	90                   	nop
    20000d9b:	c9                   	leave  
    20000d9c:	c3                   	ret    

0000000020000d9d <UVM_List_Crt>:
Input       : volatile struct UVM_List* Head - The pointer to the list head.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Crt(volatile struct UVM_List* Head)
{
    20000d9d:	f3 0f 1e fa          	endbr64 
    20000da1:	55                   	push   %rbp
    20000da2:	48 89 e5             	mov    %rsp,%rbp
    20000da5:	48 83 ec 08          	sub    $0x8,%rsp
    20000da9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    Head->Prev=(struct UVM_List*)Head;
    20000dad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000db1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000db5:	48 89 10             	mov    %rdx,(%rax)
    Head->Next=(struct UVM_List*)Head;
    20000db8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000dbc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000dc0:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
    20000dc4:	90                   	nop
    20000dc5:	c9                   	leave  
    20000dc6:	c3                   	ret    

0000000020000dc7 <UVM_List_Del>:
              volatile struct UVM_List* Next - The next node of the target node.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Del(volatile struct UVM_List* Prev,volatile struct UVM_List* Next)
{
    20000dc7:	f3 0f 1e fa          	endbr64 
    20000dcb:	55                   	push   %rbp
    20000dcc:	48 89 e5             	mov    %rsp,%rbp
    20000dcf:	48 83 ec 10          	sub    $0x10,%rsp
    20000dd3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000dd7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    Next->Prev=(struct UVM_List*)Prev;
    20000ddb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000ddf:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000de3:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)Next;
    20000de6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000dea:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20000dee:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
    20000df2:	90                   	nop
    20000df3:	c9                   	leave  
    20000df4:	c3                   	ret    

0000000020000df5 <UVM_List_Ins>:
Return      : None.
******************************************************************************/
void UVM_List_Ins(volatile struct UVM_List* New,
                  volatile struct UVM_List* Prev,
                  volatile struct UVM_List* Next)
{
    20000df5:	f3 0f 1e fa          	endbr64 
    20000df9:	55                   	push   %rbp
    20000dfa:	48 89 e5             	mov    %rsp,%rbp
    20000dfd:	48 83 ec 18          	sub    $0x18,%rsp
    20000e01:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000e05:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000e09:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    Next->Prev=(struct UVM_List*)New;
    20000e0d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000e11:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000e15:	48 89 10             	mov    %rdx,(%rax)
    New->Next=(struct UVM_List*)Next;
    20000e18:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000e1c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20000e20:	48 89 50 08          	mov    %rdx,0x8(%rax)
    New->Prev=(struct UVM_List*)Prev;
    20000e24:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000e28:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20000e2c:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)New;
    20000e2f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000e33:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000e37:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
    20000e3b:	90                   	nop
    20000e3c:	c9                   	leave  
    20000e3d:	c3                   	ret    

0000000020000e3e <UVM_Print_Int>:
Input       : cnt_t Int - The integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Int(cnt_t Int)
{
    20000e3e:	f3 0f 1e fa          	endbr64 
    20000e42:	55                   	push   %rbp
    20000e43:	48 89 e5             	mov    %rsp,%rbp
    20000e46:	48 83 ec 30          	sub    $0x30,%rsp
    20000e4a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    cnt_t Count;
    cnt_t Num;
    ptr_t Div;
    
    /* how many digits are there? */
    if(Int==0)
    20000e4e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    20000e53:	75 14                	jne    20000e69 <UVM_Print_Int+0x2b>
    {
        UVM_Putchar('0');
    20000e55:	bf 30 00 00 00       	mov    $0x30,%edi
    20000e5a:	e8 0d 0e 00 00       	call   20001c6c <UVM_Putchar>
        return 1;
    20000e5f:	b8 01 00 00 00       	mov    $0x1,%eax
    20000e64:	e9 d8 01 00 00       	jmp    20001041 <UVM_Print_Int+0x203>
    }
    else if(Int<0)
    20000e69:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    20000e6e:	0f 89 f1 00 00 00    	jns    20000f65 <UVM_Print_Int+0x127>
    {
        /* How many digits are there? */
        Count=0;
    20000e74:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    20000e7b:	00 
        Div=1;
    20000e7c:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
    20000e83:	00 
        Iter=-Int;
    20000e84:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000e88:	48 f7 d8             	neg    %rax
    20000e8b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
    20000e8f:	eb 36                	jmp    20000ec7 <UVM_Print_Int+0x89>
        {
            Iter/=10;
    20000e91:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000e95:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000e9c:	cc cc cc 
    20000e9f:	48 f7 e2             	mul    %rdx
    20000ea2:	48 89 d0             	mov    %rdx,%rax
    20000ea5:	48 c1 e8 03          	shr    $0x3,%rax
    20000ea9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
    20000ead:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
    20000eb2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000eb6:	48 89 d0             	mov    %rdx,%rax
    20000eb9:	48 c1 e0 02          	shl    $0x2,%rax
    20000ebd:	48 01 d0             	add    %rdx,%rax
    20000ec0:	48 01 c0             	add    %rax,%rax
    20000ec3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
    20000ec7:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    20000ecc:	75 c3                	jne    20000e91 <UVM_Print_Int+0x53>
        }
        Div/=10;
    20000ece:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000ed2:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000ed9:	cc cc cc 
    20000edc:	48 f7 e2             	mul    %rdx
    20000edf:	48 89 d0             	mov    %rdx,%rax
    20000ee2:	48 c1 e8 03          	shr    $0x3,%rax
    20000ee6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        UVM_Putchar('-');
    20000eea:	bf 2d 00 00 00       	mov    $0x2d,%edi
    20000eef:	e8 78 0d 00 00       	call   20001c6c <UVM_Putchar>
        Iter=-Int;
    20000ef4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000ef8:	48 f7 d8             	neg    %rax
    20000efb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count+1;
    20000eff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000f03:	48 83 c0 01          	add    $0x1,%rax
    20000f07:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
    20000f0b:	eb 4c                	jmp    20000f59 <UVM_Print_Int+0x11b>
        {
            Count--;
    20000f0d:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
    20000f12:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000f16:	ba 00 00 00 00       	mov    $0x0,%edx
    20000f1b:	48 f7 75 e0          	divq   -0x20(%rbp)
    20000f1f:	83 c0 30             	add    $0x30,%eax
    20000f22:	0f be c0             	movsbl %al,%eax
    20000f25:	89 c7                	mov    %eax,%edi
    20000f27:	e8 40 0d 00 00       	call   20001c6c <UVM_Putchar>
            Iter=Iter%Div;
    20000f2c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000f30:	ba 00 00 00 00       	mov    $0x0,%edx
    20000f35:	48 f7 75 e0          	divq   -0x20(%rbp)
    20000f39:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
    20000f3d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000f41:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000f48:	cc cc cc 
    20000f4b:	48 f7 e2             	mul    %rdx
    20000f4e:	48 89 d0             	mov    %rdx,%rax
    20000f51:	48 c1 e8 03          	shr    $0x3,%rax
    20000f55:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
    20000f59:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    20000f5e:	7f ad                	jg     20000f0d <UVM_Print_Int+0xcf>
    20000f60:	e9 d8 00 00 00       	jmp    2000103d <UVM_Print_Int+0x1ff>
        }
    }
    else
    {
        /* How many digits are there? */
        Count=0;
    20000f65:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    20000f6c:	00 
        Div=1;
    20000f6d:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
    20000f74:	00 
        Iter=Int;
    20000f75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000f79:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
    20000f7d:	eb 36                	jmp    20000fb5 <UVM_Print_Int+0x177>
        {
            Iter/=10;
    20000f7f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000f83:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000f8a:	cc cc cc 
    20000f8d:	48 f7 e2             	mul    %rdx
    20000f90:	48 89 d0             	mov    %rdx,%rax
    20000f93:	48 c1 e8 03          	shr    $0x3,%rax
    20000f97:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
    20000f9b:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
    20000fa0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000fa4:	48 89 d0             	mov    %rdx,%rax
    20000fa7:	48 c1 e0 02          	shl    $0x2,%rax
    20000fab:	48 01 d0             	add    %rdx,%rax
    20000fae:	48 01 c0             	add    %rax,%rax
    20000fb1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
    20000fb5:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    20000fba:	75 c3                	jne    20000f7f <UVM_Print_Int+0x141>
        }
        Div/=10;
    20000fbc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000fc0:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000fc7:	cc cc cc 
    20000fca:	48 f7 e2             	mul    %rdx
    20000fcd:	48 89 d0             	mov    %rdx,%rax
    20000fd0:	48 c1 e8 03          	shr    $0x3,%rax
    20000fd4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        Iter=Int;
    20000fd8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000fdc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count;
    20000fe0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000fe4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
    20000fe8:	eb 4c                	jmp    20001036 <UVM_Print_Int+0x1f8>
        {
            Count--;
    20000fea:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
    20000fef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000ff3:	ba 00 00 00 00       	mov    $0x0,%edx
    20000ff8:	48 f7 75 e0          	divq   -0x20(%rbp)
    20000ffc:	83 c0 30             	add    $0x30,%eax
    20000fff:	0f be c0             	movsbl %al,%eax
    20001002:	89 c7                	mov    %eax,%edi
    20001004:	e8 63 0c 00 00       	call   20001c6c <UVM_Putchar>
            Iter=Iter%Div;
    20001009:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000100d:	ba 00 00 00 00       	mov    $0x0,%edx
    20001012:	48 f7 75 e0          	divq   -0x20(%rbp)
    20001016:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
    2000101a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2000101e:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20001025:	cc cc cc 
    20001028:	48 f7 e2             	mul    %rdx
    2000102b:	48 89 d0             	mov    %rdx,%rax
    2000102e:	48 c1 e8 03          	shr    $0x3,%rax
    20001032:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
    20001036:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    2000103b:	7f ad                	jg     20000fea <UVM_Print_Int+0x1ac>
        }
    }
    
    return Num;
    2000103d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
    20001041:	c9                   	leave  
    20001042:	c3                   	ret    

0000000020001043 <UVM_Print_Uint>:
Input       : ptr_t Uint - The unsigned integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Uint(ptr_t Uint)
{
    20001043:	f3 0f 1e fa          	endbr64 
    20001047:	55                   	push   %rbp
    20001048:	48 89 e5             	mov    %rsp,%rbp
    2000104b:	48 83 ec 30          	sub    $0x30,%rsp
    2000104f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    ptr_t Iter;
    cnt_t Count;
    cnt_t Num;
    
    /* how many digits are there? */
    if(Uint==0)
    20001053:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    20001058:	75 14                	jne    2000106e <UVM_Print_Uint+0x2b>
    {
        UVM_Putchar('0');
    2000105a:	bf 30 00 00 00       	mov    $0x30,%edi
    2000105f:	e8 08 0c 00 00       	call   20001c6c <UVM_Putchar>
        return 1;
    20001064:	b8 01 00 00 00       	mov    $0x1,%eax
    20001069:	e9 98 00 00 00       	jmp    20001106 <UVM_Print_Uint+0xc3>
    }
    else
    {
        /* Filter out all the zeroes */
        Count=0;
    2000106e:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    20001075:	00 
        Iter=Uint;
    20001076:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2000107a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    2000107e:	eb 0a                	jmp    2000108a <UVM_Print_Uint+0x47>
        {
            Iter<<=4;
    20001080:	48 c1 65 f8 04       	shlq   $0x4,-0x8(%rbp)
            Count++;
    20001085:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    2000108a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000108e:	48 c1 e8 3c          	shr    $0x3c,%rax
    20001092:	48 85 c0             	test   %rax,%rax
    20001095:	74 e9                	je     20001080 <UVM_Print_Uint+0x3d>
        }
        /* Count is the number of pts to print */
        Count=sizeof(ptr_t)*2-Count;
    20001097:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000109b:	b8 10 00 00 00       	mov    $0x10,%eax
    200010a0:	48 29 d0             	sub    %rdx,%rax
    200010a3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        Num=Count;
    200010a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200010ab:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        while(Count>0)
    200010af:	eb 4a                	jmp    200010fb <UVM_Print_Uint+0xb8>
        {
            Count--;
    200010b1:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            Iter=(Uint>>(Count*4))&0x0F;
    200010b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200010ba:	c1 e0 02             	shl    $0x2,%eax
    200010bd:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    200010c1:	89 c1                	mov    %eax,%ecx
    200010c3:	48 d3 ea             	shr    %cl,%rdx
    200010c6:	48 89 d0             	mov    %rdx,%rax
    200010c9:	83 e0 0f             	and    $0xf,%eax
    200010cc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            if(Iter<10)
    200010d0:	48 83 7d f8 09       	cmpq   $0x9,-0x8(%rbp)
    200010d5:	77 13                	ja     200010ea <UVM_Print_Uint+0xa7>
                UVM_Putchar('0'+Iter);
    200010d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200010db:	83 c0 30             	add    $0x30,%eax
    200010de:	0f be c0             	movsbl %al,%eax
    200010e1:	89 c7                	mov    %eax,%edi
    200010e3:	e8 84 0b 00 00       	call   20001c6c <UVM_Putchar>
    200010e8:	eb 11                	jmp    200010fb <UVM_Print_Uint+0xb8>
            else
                UVM_Putchar('A'+Iter-10);
    200010ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200010ee:	83 c0 37             	add    $0x37,%eax
    200010f1:	0f be c0             	movsbl %al,%eax
    200010f4:	89 c7                	mov    %eax,%edi
    200010f6:	e8 71 0b 00 00       	call   20001c6c <UVM_Putchar>
        while(Count>0)
    200010fb:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    20001100:	7f af                	jg     200010b1 <UVM_Print_Uint+0x6e>
        }
    }
    
    return Num;
    20001102:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
    20001106:	c9                   	leave  
    20001107:	c3                   	ret    

0000000020001108 <UVM_Print_String>:
Input       : s8* String - The string to print.
Output      : None.
Return      : cnt_t - The length of the string printed, the '\0' is not included.
******************************************************************************/
cnt_t UVM_Print_String(s8* String)
{
    20001108:	f3 0f 1e fa          	endbr64 
    2000110c:	55                   	push   %rbp
    2000110d:	48 89 e5             	mov    %rsp,%rbp
    20001110:	48 83 ec 20          	sub    $0x20,%rsp
    20001114:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    cnt_t Count;
    
    Count=0;
    20001118:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    2000111f:	00 
    while(Count<UVM_USER_DEBUG_MAX_STR)
    20001120:	eb 35                	jmp    20001157 <UVM_Print_String+0x4f>
    {
        if(String[Count]=='\0')
    20001122:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001126:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2000112a:	48 01 d0             	add    %rdx,%rax
    2000112d:	0f b6 00             	movzbl (%rax),%eax
    20001130:	84 c0                	test   %al,%al
    20001132:	74 2c                	je     20001160 <UVM_Print_String+0x58>
            break;
        
        UVM_Putchar(String[Count++]);
    20001134:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001138:	48 8d 50 01          	lea    0x1(%rax),%rdx
    2000113c:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    20001140:	48 89 c2             	mov    %rax,%rdx
    20001143:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001147:	48 01 d0             	add    %rdx,%rax
    2000114a:	0f b6 00             	movzbl (%rax),%eax
    2000114d:	0f be c0             	movsbl %al,%eax
    20001150:	89 c7                	mov    %eax,%edi
    20001152:	e8 15 0b 00 00       	call   20001c6c <UVM_Putchar>
    while(Count<UVM_USER_DEBUG_MAX_STR)
    20001157:	48 83 7d f8 7f       	cmpq   $0x7f,-0x8(%rbp)
    2000115c:	7e c4                	jle    20001122 <UVM_Print_String+0x1a>
    2000115e:	eb 01                	jmp    20001161 <UVM_Print_String+0x59>
            break;
    20001160:	90                   	nop
    }
    
    return Count;
    20001161:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    20001165:	c9                   	leave  
    20001166:	c3                   	ret    

0000000020001167 <UVM_Captbl_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, 
                     cid_t Cap_Captbl, ptr_t Vaddr, ptr_t Entry_Num)
{
    20001167:	f3 0f 1e fa          	endbr64 
    2000116b:	55                   	push   %rbp
    2000116c:	48 89 e5             	mov    %rsp,%rbp
    2000116f:	48 83 ec 30          	sub    $0x30,%rsp
    20001173:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001177:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2000117b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    2000117f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20001183:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
    20001187:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000118b:	48 c1 e0 20          	shl    $0x20,%rax
    2000118f:	48 89 c2             	mov    %rax,%rdx
    20001192:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001196:	89 c0                	mov    %eax,%eax
    20001198:	48 89 d6             	mov    %rdx,%rsi
    2000119b:	48 09 c6             	or     %rax,%rsi
    2000119e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200011a2:	48 ba 00 00 00 00 0a 	movabs $0xa00000000,%rdx
    200011a9:	00 00 00 
    200011ac:	48 09 d0             	or     %rdx,%rax
    200011af:	48 89 c7             	mov    %rax,%rdi
    200011b2:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    200011b6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200011ba:	48 89 d1             	mov    %rdx,%rcx
    200011bd:	48 89 c2             	mov    %rax,%rdx
    200011c0:	e8 28 ef ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Captbl),
                      Vaddr,
                      Entry_Num);
}
    200011c5:	c9                   	leave  
    200011c6:	c3                   	ret    

00000000200011c7 <UVM_Captbl_Del>:
              cid_t Cap_Del - The capability to the capability table to be deleted. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Del(cid_t Cap_Captbl_Del, cid_t Cap_Del)
{
    200011c7:	f3 0f 1e fa          	endbr64 
    200011cb:	55                   	push   %rbp
    200011cc:	48 89 e5             	mov    %rsp,%rbp
    200011cf:	48 83 ec 10          	sub    $0x10,%rsp
    200011d3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200011d7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_DEL, Cap_Captbl_Del,
    200011db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200011df:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200011e3:	48 b9 00 00 00 00 0b 	movabs $0xb00000000,%rcx
    200011ea:	00 00 00 
    200011ed:	48 09 ca             	or     %rcx,%rdx
    200011f0:	48 89 d7             	mov    %rdx,%rdi
    200011f3:	b9 00 00 00 00       	mov    $0x0,%ecx
    200011f8:	ba 00 00 00 00       	mov    $0x0,%edx
    200011fd:	48 89 c6             	mov    %rax,%rsi
    20001200:	e8 e8 ee ff ff       	call   200000ed <UVM_Svc>
                      Cap_Del,
                      0,
                      0);
}
    20001205:	c9                   	leave  
    20001206:	c3                   	ret    

0000000020001207 <UVM_Captbl_Frz>:
              cid_t Cap_Frz - The cap to the kernel object being freezed. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Frz(cid_t Cap_Captbl_Frz, cid_t Cap_Frz)
{
    20001207:	f3 0f 1e fa          	endbr64 
    2000120b:	55                   	push   %rbp
    2000120c:	48 89 e5             	mov    %rsp,%rbp
    2000120f:	48 83 ec 10          	sub    $0x10,%rsp
    20001213:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001217:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
        return UVM_CAP_OP(RME_SVC_CPT_FRZ, Cap_Captbl_Frz,
    2000121b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000121f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001223:	48 b9 00 00 00 00 0c 	movabs $0xc00000000,%rcx
    2000122a:	00 00 00 
    2000122d:	48 09 ca             	or     %rcx,%rdx
    20001230:	48 89 d7             	mov    %rdx,%rdi
    20001233:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001238:	ba 00 00 00 00       	mov    $0x0,%edx
    2000123d:	48 89 c6             	mov    %rax,%rsi
    20001240:	e8 a8 ee ff ff       	call   200000ed <UVM_Svc>
                          Cap_Frz,
                          0,
                          0);
}
    20001245:	c9                   	leave  
    20001246:	c3                   	ret    

0000000020001247 <UVM_Captbl_Add>:
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Add(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                     cid_t Cap_Captbl_Src, cid_t Cap_Src, ptr_t Flags)
{
    20001247:	f3 0f 1e fa          	endbr64 
    2000124b:	55                   	push   %rbp
    2000124c:	48 89 e5             	mov    %rsp,%rbp
    2000124f:	48 83 ec 30          	sub    $0x30,%rsp
    20001253:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001257:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2000125b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    2000125f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20001263:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20001267:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2000126b:	48 c1 e0 20          	shl    $0x20,%rax
    2000126f:	48 89 c2             	mov    %rax,%rdx
    20001272:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001276:	89 c0                	mov    %eax,%eax
    20001278:	48 09 c2             	or     %rax,%rdx
    2000127b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000127f:	48 c1 e0 20          	shl    $0x20,%rax
    20001283:	48 89 c1             	mov    %rax,%rcx
    20001286:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000128a:	89 c0                	mov    %eax,%eax
    2000128c:	48 09 c1             	or     %rax,%rcx
    2000128f:	48 89 ce             	mov    %rcx,%rsi
    20001292:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20001296:	48 89 c1             	mov    %rax,%rcx
    20001299:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    200012a0:	00 00 00 
    200012a3:	48 89 c7             	mov    %rax,%rdi
    200012a6:	e8 42 ee ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),Flags);
}
    200012ab:	c9                   	leave  
    200012ac:	c3                   	ret    

00000000200012ad <UVM_Captbl_Pgtbl>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Pgtbl(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                       cid_t Cap_Captbl_Src, cid_t Cap_Src,
                       ptr_t Start, ptr_t End, ptr_t Flags)
{
    200012ad:	f3 0f 1e fa          	endbr64 
    200012b1:	55                   	push   %rbp
    200012b2:	48 89 e5             	mov    %rsp,%rbp
    200012b5:	48 83 ec 30          	sub    $0x30,%rsp
    200012b9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200012bd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200012c1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200012c5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    200012c9:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    200012cd:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    200012d1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    200012d5:	48 c1 e0 24          	shl    $0x24,%rax
    200012d9:	48 89 c2             	mov    %rax,%rdx
    200012dc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    200012e0:	48 c1 e0 08          	shl    $0x8,%rax
    200012e4:	48 09 d0             	or     %rdx,%rax
    200012e7:	48 0b 45 10          	or     0x10(%rbp),%rax
    200012eb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    200012ef:	48 89 d1             	mov    %rdx,%rcx
    200012f2:	48 c1 e1 20          	shl    $0x20,%rcx
    200012f6:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    200012fa:	89 d2                	mov    %edx,%edx
    200012fc:	48 09 ca             	or     %rcx,%rdx
    200012ff:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    20001303:	48 89 ce             	mov    %rcx,%rsi
    20001306:	48 c1 e6 20          	shl    $0x20,%rsi
    2000130a:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    2000130e:	89 c9                	mov    %ecx,%ecx
    20001310:	48 09 ce             	or     %rcx,%rsi
    20001313:	48 89 c1             	mov    %rax,%rcx
    20001316:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    2000131d:	00 00 00 
    20001320:	48 89 c7             	mov    %rax,%rdi
    20001323:	e8 c5 ed ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_PGTBL_FLAG(End,Start,Flags));
}
    20001328:	c9                   	leave  
    20001329:	c3                   	ret    

000000002000132a <UVM_Captbl_Kern>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kern(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End)
{
    2000132a:	f3 0f 1e fa          	endbr64 
    2000132e:	55                   	push   %rbp
    2000132f:	48 89 e5             	mov    %rsp,%rbp
    20001332:	48 83 ec 30          	sub    $0x30,%rsp
    20001336:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000133a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2000133e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001342:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20001346:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    2000134a:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    2000134e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20001352:	48 c1 e0 20          	shl    $0x20,%rax
    20001356:	48 0b 45 d8          	or     -0x28(%rbp),%rax
    2000135a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2000135e:	48 c1 e2 20          	shl    $0x20,%rdx
    20001362:	48 89 d1             	mov    %rdx,%rcx
    20001365:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20001369:	89 d2                	mov    %edx,%edx
    2000136b:	48 09 ca             	or     %rcx,%rdx
    2000136e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    20001372:	48 89 ce             	mov    %rcx,%rsi
    20001375:	48 c1 e6 20          	shl    $0x20,%rsi
    20001379:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    2000137d:	89 c9                	mov    %ecx,%ecx
    2000137f:	48 09 ce             	or     %rcx,%rsi
    20001382:	48 89 c1             	mov    %rax,%rcx
    20001385:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    2000138c:	00 00 00 
    2000138f:	48 89 c7             	mov    %rax,%rdi
    20001392:	e8 56 ed ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KERN_FLAG(End,Start));
}
    20001397:	c9                   	leave  
    20001398:	c3                   	ret    

0000000020001399 <UVM_Captbl_Kmem>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kmem(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End, ptr_t Flags)
{
    20001399:	f3 0f 1e fa          	endbr64 
    2000139d:	55                   	push   %rbp
    2000139e:	48 89 e5             	mov    %rsp,%rbp
    200013a1:	48 83 ec 30          	sub    $0x30,%rsp
    200013a5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200013a9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200013ad:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200013b1:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    200013b5:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    200013b9:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(UVM_KMEM_SVC(End,RME_SVC_CPT_ADD), UVM_KMEM_CAPID(Start,Flags),
    200013bd:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
    200013c4:	ff ff ff 
    200013c7:	48 23 45 d0          	and    -0x30(%rbp),%rax
    200013cb:	48 89 c2             	mov    %rax,%rdx
    200013ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    200013d2:	48 c1 e8 20          	shr    $0x20,%rax
    200013d6:	48 89 d1             	mov    %rdx,%rcx
    200013d9:	48 09 c1             	or     %rax,%rcx
    200013dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200013e0:	48 c1 e0 20          	shl    $0x20,%rax
    200013e4:	48 89 c2             	mov    %rax,%rdx
    200013e7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200013eb:	89 c0                	mov    %eax,%eax
    200013ed:	48 09 c2             	or     %rax,%rdx
    200013f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200013f4:	48 c1 e0 20          	shl    $0x20,%rax
    200013f8:	48 89 c6             	mov    %rax,%rsi
    200013fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200013ff:	89 c0                	mov    %eax,%eax
    20001401:	48 09 c6             	or     %rax,%rsi
    20001404:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20001408:	48 c1 e8 06          	shr    $0x6,%rax
    2000140c:	48 c1 e0 26          	shl    $0x26,%rax
    20001410:	48 89 c7             	mov    %rax,%rdi
    20001413:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20001417:	48 c1 e8 06          	shr    $0x6,%rax
    2000141b:	48 c1 e0 26          	shl    $0x26,%rax
    2000141f:	48 c1 e8 20          	shr    $0x20,%rax
    20001423:	48 0b 45 10          	or     0x10(%rbp),%rax
    20001427:	48 09 c7             	or     %rax,%rdi
    2000142a:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20001431:	00 00 00 
    20001434:	48 09 f8             	or     %rdi,%rax
    20001437:	48 89 c7             	mov    %rax,%rdi
    2000143a:	e8 ae ec ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KMEM_FLAG(End,Start));
}
    2000143f:	c9                   	leave  
    20001440:	c3                   	ret    

0000000020001441 <UVM_Captbl_Rem>:
              cid_t Cap_Rem - The capability slot you want to remove. 1-Level.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Rem(cid_t Cap_Captbl_Rem, cid_t Cap_Rem)
{
    20001441:	f3 0f 1e fa          	endbr64 
    20001445:	55                   	push   %rbp
    20001446:	48 89 e5             	mov    %rsp,%rbp
    20001449:	48 83 ec 10          	sub    $0x10,%rsp
    2000144d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001451:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_REM, Cap_Captbl_Rem,
    20001455:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001459:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    2000145d:	48 b9 00 00 00 00 0e 	movabs $0xe00000000,%rcx
    20001464:	00 00 00 
    20001467:	48 09 ca             	or     %rcx,%rdx
    2000146a:	48 89 d7             	mov    %rdx,%rdi
    2000146d:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001472:	ba 00 00 00 00       	mov    $0x0,%edx
    20001477:	48 89 c6             	mov    %rax,%rsi
    2000147a:	e8 6e ec ff ff       	call   200000ed <UVM_Svc>
                      Cap_Rem,
                      0,
                      0);
}
    2000147f:	c9                   	leave  
    20001480:	c3                   	ret    

0000000020001481 <UVM_Kern_Act>:
                      kernel function ever causes a context switch, it is responsible
                      for setting the return value. On failure, a context switch 
                      in the kernel fucntion is banned.
******************************************************************************/
ret_t UVM_Kern_Act(cid_t Cap_Kern, ptr_t Func_ID, ptr_t Sub_ID, ptr_t Param1, ptr_t Param2)
{
    20001481:	f3 0f 1e fa          	endbr64 
    20001485:	55                   	push   %rbp
    20001486:	48 89 e5             	mov    %rsp,%rbp
    20001489:	48 83 ec 30          	sub    $0x30,%rsp
    2000148d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001491:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001495:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001499:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    2000149d:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
    200014a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200014a5:	48 c1 e0 20          	shl    $0x20,%rax
    200014a9:	48 89 c2             	mov    %rax,%rdx
    200014ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200014b0:	89 c0                	mov    %eax,%eax
    200014b2:	48 89 d6             	mov    %rdx,%rsi
    200014b5:	48 09 c6             	or     %rax,%rsi
    200014b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200014bc:	48 ba 00 00 00 00 04 	movabs $0x400000000,%rdx
    200014c3:	00 00 00 
    200014c6:	48 09 d0             	or     %rdx,%rax
    200014c9:	48 89 c7             	mov    %rax,%rdi
    200014cc:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    200014d0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200014d4:	48 89 d1             	mov    %rdx,%rcx
    200014d7:	48 89 c2             	mov    %rax,%rdx
    200014da:	e8 0e ec ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Sub_ID)|UVM_PARAM_D0(Func_ID),
                      Param1,
                      Param2);
}
    200014df:	c9                   	leave  
    200014e0:	c3                   	ret    

00000000200014e1 <UVM_Pgtbl_Crt>:
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Pgtbl, 
                    ptr_t Vaddr, ptr_t Start_Addr, ptr_t Top_Flag,
                    ptr_t Size_Order, ptr_t Num_Order)
{
    200014e1:	f3 0f 1e fa          	endbr64 
    200014e5:	55                   	push   %rbp
    200014e6:	48 89 e5             	mov    %rsp,%rbp
    200014e9:	48 83 ec 30          	sub    $0x30,%rsp
    200014ed:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200014f1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200014f5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200014f9:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    200014fd:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20001501:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
    20001505:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20001509:	48 0b 45 d0          	or     -0x30(%rbp),%rax
    2000150d:	48 89 c2             	mov    %rax,%rdx
    20001510:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001514:	48 c1 e0 20          	shl    $0x20,%rax
    20001518:	48 89 c1             	mov    %rax,%rcx
    2000151b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2000151f:	48 c1 e0 10          	shl    $0x10,%rax
    20001523:	89 c0                	mov    %eax,%eax
    20001525:	48 09 c1             	or     %rax,%rcx
    20001528:	48 8b 45 10          	mov    0x10(%rbp),%rax
    2000152c:	0f b7 c0             	movzwl %ax,%eax
    2000152f:	48 89 ce             	mov    %rcx,%rsi
    20001532:	48 09 c6             	or     %rax,%rsi
    20001535:	48 8b 45 18          	mov    0x18(%rbp),%rax
    20001539:	48 c1 e0 10          	shl    $0x10,%rax
    2000153d:	48 c1 e0 20          	shl    $0x20,%rax
    20001541:	48 89 c1             	mov    %rax,%rcx
    20001544:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001548:	48 09 c1             	or     %rax,%rcx
    2000154b:	48 b8 00 00 00 00 0f 	movabs $0xf00000000,%rax
    20001552:	00 00 00 
    20001555:	48 89 cf             	mov    %rcx,%rdi
    20001558:	48 09 c7             	or     %rax,%rdi
    2000155b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2000155f:	48 89 d1             	mov    %rdx,%rcx
    20001562:	48 89 c2             	mov    %rax,%rdx
    20001565:	e8 83 eb ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_Q1(Cap_Pgtbl)|UVM_PARAM_Q0(Size_Order),
                      Vaddr, 
                      Start_Addr|Top_Flag);
}
    2000156a:	c9                   	leave  
    2000156b:	c3                   	ret    

000000002000156c <UVM_Pgtbl_Del>:
                                page table capability to be in. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Del(cid_t Cap_Captbl, cid_t Cap_Pgtbl)
{
    2000156c:	f3 0f 1e fa          	endbr64 
    20001570:	55                   	push   %rbp
    20001571:	48 89 e5             	mov    %rsp,%rbp
    20001574:	48 83 ec 10          	sub    $0x10,%rsp
    20001578:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000157c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DEL, Cap_Captbl,
    20001580:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001584:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001588:	48 b9 00 00 00 00 10 	movabs $0x1000000000,%rcx
    2000158f:	00 00 00 
    20001592:	48 09 ca             	or     %rcx,%rdx
    20001595:	48 89 d7             	mov    %rdx,%rdi
    20001598:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000159d:	ba 00 00 00 00       	mov    $0x0,%edx
    200015a2:	48 89 c6             	mov    %rax,%rsi
    200015a5:	e8 43 eb ff ff       	call   200000ed <UVM_Svc>
                      Cap_Pgtbl,
                      0,
                      0);
}
    200015aa:	c9                   	leave  
    200015ab:	c3                   	ret    

00000000200015ac <UVM_Pgtbl_Add>:
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Add(cid_t Cap_Pgtbl_Dst, ptr_t Pos_Dst, ptr_t Flags_Dst,
                    cid_t Cap_Pgtbl_Src, ptr_t Pos_Src, ptr_t Index)
{
    200015ac:	f3 0f 1e fa          	endbr64 
    200015b0:	55                   	push   %rbp
    200015b1:	48 89 e5             	mov    %rsp,%rbp
    200015b4:	48 83 ec 30          	sub    $0x30,%rsp
    200015b8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200015bc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200015c0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200015c4:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    200015c8:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    200015cc:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_ADD, Flags_Dst,
    200015d0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200015d4:	48 c1 e0 20          	shl    $0x20,%rax
    200015d8:	48 89 c2             	mov    %rax,%rdx
    200015db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    200015df:	89 c0                	mov    %eax,%eax
    200015e1:	48 89 d7             	mov    %rdx,%rdi
    200015e4:	48 09 c7             	or     %rax,%rdi
    200015e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200015eb:	48 c1 e0 20          	shl    $0x20,%rax
    200015ef:	48 89 c2             	mov    %rax,%rdx
    200015f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200015f6:	89 c0                	mov    %eax,%eax
    200015f8:	48 89 d6             	mov    %rdx,%rsi
    200015fb:	48 09 c6             	or     %rax,%rsi
    200015fe:	48 b8 00 00 00 00 11 	movabs $0x1100000000,%rax
    20001605:	00 00 00 
    20001608:	48 0b 45 e8          	or     -0x18(%rbp),%rax
    2000160c:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    20001610:	48 89 d1             	mov    %rdx,%rcx
    20001613:	48 89 fa             	mov    %rdi,%rdx
    20001616:	48 89 c7             	mov    %rax,%rdi
    20001619:	e8 cf ea ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Dst)|UVM_PARAM_D0(Pos_Dst),
                      UVM_PARAM_D1(Cap_Pgtbl_Src)|UVM_PARAM_D0(Pos_Src),
                      Index);
}
    2000161e:	c9                   	leave  
    2000161f:	c3                   	ret    

0000000020001620 <UVM_Pgtbl_Rem>:
              ptr_t Pos - The virtual address position to unmap from.
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Rem(cid_t Cap_Pgtbl, ptr_t Pos)
{
    20001620:	f3 0f 1e fa          	endbr64 
    20001624:	55                   	push   %rbp
    20001625:	48 89 e5             	mov    %rsp,%rbp
    20001628:	48 83 ec 10          	sub    $0x10,%rsp
    2000162c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001630:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_REM, 0,
    20001634:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001638:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000163c:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001641:	48 89 c6             	mov    %rax,%rsi
    20001644:	48 b8 00 00 00 00 12 	movabs $0x1200000000,%rax
    2000164b:	00 00 00 
    2000164e:	48 89 c7             	mov    %rax,%rdi
    20001651:	e8 97 ea ff ff       	call   200000ed <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    20001656:	c9                   	leave  
    20001657:	c3                   	ret    

0000000020001658 <UVM_Pgtbl_Con>:
              ptr_t Flags_Child - This have no effect on MPU-based architectures.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Con(cid_t Cap_Pgtbl_Parent, ptr_t Pos, cid_t Cap_Pgtbl_Child, ptr_t Flags_Child)
{
    20001658:	f3 0f 1e fa          	endbr64 
    2000165c:	55                   	push   %rbp
    2000165d:	48 89 e5             	mov    %rsp,%rbp
    20001660:	48 83 ec 20          	sub    $0x20,%rsp
    20001664:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001668:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2000166c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001670:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
    20001674:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001678:	48 c1 e0 20          	shl    $0x20,%rax
    2000167c:	48 89 c2             	mov    %rax,%rdx
    2000167f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001683:	89 c0                	mov    %eax,%eax
    20001685:	48 89 d6             	mov    %rdx,%rsi
    20001688:	48 09 c6             	or     %rax,%rsi
    2000168b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    2000168f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001693:	48 89 d1             	mov    %rdx,%rcx
    20001696:	48 89 c2             	mov    %rax,%rdx
    20001699:	48 b8 00 00 00 00 13 	movabs $0x1300000000,%rax
    200016a0:	00 00 00 
    200016a3:	48 89 c7             	mov    %rax,%rdi
    200016a6:	e8 42 ea ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Parent)|UVM_PARAM_D0(Cap_Pgtbl_Child),
                      Pos,
                      Flags_Child);
}
    200016ab:	c9                   	leave  
    200016ac:	c3                   	ret    

00000000200016ad <UVM_Pgtbl_Des>:
                          table from.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Des(cid_t Cap_Pgtbl, ptr_t Pos)
{
    200016ad:	f3 0f 1e fa          	endbr64 
    200016b1:	55                   	push   %rbp
    200016b2:	48 89 e5             	mov    %rsp,%rbp
    200016b5:	48 83 ec 10          	sub    $0x10,%rsp
    200016b9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200016bd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DES, 0,
    200016c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200016c5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200016c9:	b9 00 00 00 00       	mov    $0x0,%ecx
    200016ce:	48 89 c6             	mov    %rax,%rsi
    200016d1:	48 b8 00 00 00 00 14 	movabs $0x1400000000,%rax
    200016d8:	00 00 00 
    200016db:	48 89 c7             	mov    %rax,%rdi
    200016de:	e8 0a ea ff ff       	call   200000ed <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    200016e3:	c9                   	leave  
    200016e4:	c3                   	ret    

00000000200016e5 <UVM_Proc_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, cid_t Cap_Proc,
                   cid_t Cap_Captbl, cid_t Cap_Pgtbl, ptr_t Vaddr)
{
    200016e5:	f3 0f 1e fa          	endbr64 
    200016e9:	55                   	push   %rbp
    200016ea:	48 89 e5             	mov    %rsp,%rbp
    200016ed:	48 83 ec 30          	sub    $0x30,%rsp
    200016f1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200016f5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200016f9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200016fd:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20001701:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20001705:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
    20001709:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    2000170d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20001711:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001715:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
    20001719:	48 bf 00 00 00 00 15 	movabs $0x1500000000,%rdi
    20001720:	00 00 00 
    20001723:	48 09 f7             	or     %rsi,%rdi
    20001726:	48 89 c6             	mov    %rax,%rsi
    20001729:	e8 bf e9 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Captbl,
                      Cap_Pgtbl);
}
    2000172e:	c9                   	leave  
    2000172f:	c3                   	ret    

0000000020001730 <UVM_Proc_Del>:
              cid_t Cap_Proc - The capability to the process. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Del(cid_t Cap_Captbl, cid_t Cap_Proc)
{
    20001730:	f3 0f 1e fa          	endbr64 
    20001734:	55                   	push   %rbp
    20001735:	48 89 e5             	mov    %rsp,%rbp
    20001738:	48 83 ec 10          	sub    $0x10,%rsp
    2000173c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001740:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_DEL, Cap_Captbl,
    20001744:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001748:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    2000174c:	48 b9 00 00 00 00 16 	movabs $0x1600000000,%rcx
    20001753:	00 00 00 
    20001756:	48 09 ca             	or     %rcx,%rdx
    20001759:	48 89 d7             	mov    %rdx,%rdi
    2000175c:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001761:	ba 00 00 00 00       	mov    $0x0,%edx
    20001766:	48 89 c6             	mov    %rax,%rsi
    20001769:	e8 7f e9 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      0,
                      0);
}
    2000176e:	c9                   	leave  
    2000176f:	c3                   	ret    

0000000020001770 <UVM_Proc_Cpt>:
                                 this process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Cpt(cid_t Cap_Proc, cid_t Cap_Captbl)
{
    20001770:	f3 0f 1e fa          	endbr64 
    20001774:	55                   	push   %rbp
    20001775:	48 89 e5             	mov    %rsp,%rbp
    20001778:	48 83 ec 10          	sub    $0x10,%rsp
    2000177c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001780:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CPT, 0,
    20001784:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001788:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000178c:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001791:	48 89 c6             	mov    %rax,%rsi
    20001794:	48 b8 00 00 00 00 17 	movabs $0x1700000000,%rax
    2000179b:	00 00 00 
    2000179e:	48 89 c7             	mov    %rax,%rdi
    200017a1:	e8 47 e9 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Captbl,
                      0);
}
    200017a6:	c9                   	leave  
    200017a7:	c3                   	ret    

00000000200017a8 <UVM_Proc_Pgt>:
                                process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Pgt(cid_t Cap_Proc, cid_t Cap_Pgtbl)
{
    200017a8:	f3 0f 1e fa          	endbr64 
    200017ac:	55                   	push   %rbp
    200017ad:	48 89 e5             	mov    %rsp,%rbp
    200017b0:	48 83 ec 10          	sub    $0x10,%rsp
    200017b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200017b8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_PGT, 0,
    200017bc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200017c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200017c4:	b9 00 00 00 00       	mov    $0x0,%ecx
    200017c9:	48 89 c6             	mov    %rax,%rsi
    200017cc:	48 b8 00 00 00 00 18 	movabs $0x1800000000,%rax
    200017d3:	00 00 00 
    200017d6:	48 89 c7             	mov    %rax,%rdi
    200017d9:	e8 0f e9 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Pgtbl,
                      0);
}
    200017de:	c9                   	leave  
    200017df:	c3                   	ret    

00000000200017e0 <UVM_Thd_Crt>:
Output      : None.
Return      : ret_t - If successful, the Thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Thd,
                  cid_t Cap_Proc, ptr_t Max_Prio, ptr_t Vaddr)
{
    200017e0:	f3 0f 1e fa          	endbr64 
    200017e4:	55                   	push   %rbp
    200017e5:	48 89 e5             	mov    %rsp,%rbp
    200017e8:	48 83 ec 30          	sub    $0x30,%rsp
    200017ec:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200017f0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200017f4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200017f8:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    200017fc:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20001800:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
    20001804:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001808:	48 c1 e0 20          	shl    $0x20,%rax
    2000180c:	48 89 c2             	mov    %rax,%rdx
    2000180f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20001813:	89 c0                	mov    %eax,%eax
    20001815:	48 09 c2             	or     %rax,%rdx
    20001818:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000181c:	48 c1 e0 20          	shl    $0x20,%rax
    20001820:	48 89 c1             	mov    %rax,%rcx
    20001823:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001827:	89 c0                	mov    %eax,%eax
    20001829:	48 89 ce             	mov    %rcx,%rsi
    2000182c:	48 09 c6             	or     %rax,%rsi
    2000182f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001833:	48 b9 00 00 00 00 19 	movabs $0x1900000000,%rcx
    2000183a:	00 00 00 
    2000183d:	48 09 c8             	or     %rcx,%rax
    20001840:	48 89 c7             	mov    %rax,%rdi
    20001843:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20001847:	48 89 c1             	mov    %rax,%rcx
    2000184a:	e8 9e e8 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Thd),
                      UVM_PARAM_D1(Cap_Proc)|UVM_PARAM_D0(Max_Prio),
                      Vaddr);
}
    2000184f:	c9                   	leave  
    20001850:	c3                   	ret    

0000000020001851 <UVM_Thd_Del>:
              cid_t Cap_Thd - The capability to the thread in the captbl. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Del(cid_t Cap_Captbl, cid_t Cap_Thd)
{
    20001851:	f3 0f 1e fa          	endbr64 
    20001855:	55                   	push   %rbp
    20001856:	48 89 e5             	mov    %rsp,%rbp
    20001859:	48 83 ec 10          	sub    $0x10,%rsp
    2000185d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001861:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_DEL, Cap_Captbl,
    20001865:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001869:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    2000186d:	48 b9 00 00 00 00 1a 	movabs $0x1a00000000,%rcx
    20001874:	00 00 00 
    20001877:	48 09 ca             	or     %rcx,%rdx
    2000187a:	48 89 d7             	mov    %rdx,%rdi
    2000187d:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001882:	ba 00 00 00 00       	mov    $0x0,%edx
    20001887:	48 89 c6             	mov    %rax,%rsi
    2000188a:	e8 5e e8 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      0,
                      0);
}
    2000188f:	c9                   	leave  
    20001890:	c3                   	ret    

0000000020001891 <UVM_Thd_Exec_Set>:
              ptr_t Param - The parameter of the thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Exec_Set(cid_t Cap_Thd, ptr_t Entry, ptr_t Stack, ptr_t Param)
{
    20001891:	f3 0f 1e fa          	endbr64 
    20001895:	55                   	push   %rbp
    20001896:	48 89 e5             	mov    %rsp,%rbp
    20001899:	48 83 ec 20          	sub    $0x20,%rsp
    2000189d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200018a1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200018a5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200018a9:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, Cap_Thd,
    200018ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200018b1:	48 ba 00 00 00 00 06 	movabs $0x600000000,%rdx
    200018b8:	00 00 00 
    200018bb:	48 09 d0             	or     %rdx,%rax
    200018be:	48 89 c7             	mov    %rax,%rdi
    200018c1:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    200018c5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    200018c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200018cd:	48 89 c6             	mov    %rax,%rsi
    200018d0:	e8 18 e8 ff ff       	call   200000ed <UVM_Svc>
                      Entry, 
                      Stack,
                      Param);
}
    200018d5:	c9                   	leave  
    200018d6:	c3                   	ret    

00000000200018d7 <UVM_Thd_Hyp_Set>:
                            thread's register sets.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Hyp_Set(cid_t Cap_Thd, ptr_t Kaddr)
{
    200018d7:	f3 0f 1e fa          	endbr64 
    200018db:	55                   	push   %rbp
    200018dc:	48 89 e5             	mov    %rsp,%rbp
    200018df:	48 83 ec 10          	sub    $0x10,%rsp
    200018e3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200018e7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, 0,
    200018eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200018ef:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200018f3:	b9 00 00 00 00       	mov    $0x0,%ecx
    200018f8:	48 89 c6             	mov    %rax,%rsi
    200018fb:	48 b8 00 00 00 00 06 	movabs $0x600000000,%rax
    20001902:	00 00 00 
    20001905:	48 89 c7             	mov    %rax,%rdi
    20001908:	e8 e0 e7 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      Kaddr,
                      0);
}
    2000190d:	c9                   	leave  
    2000190e:	c3                   	ret    

000000002000190f <UVM_Thd_Sched_Bind>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Bind(cid_t Cap_Thd, cid_t Cap_Thd_Sched, cid_t Cap_Sig, tid_t TID, ptr_t Prio)
{
    2000190f:	f3 0f 1e fa          	endbr64 
    20001913:	55                   	push   %rbp
    20001914:	48 89 e5             	mov    %rsp,%rbp
    20001917:	48 83 ec 30          	sub    $0x30,%rsp
    2000191b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000191f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001923:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001927:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    2000192b:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    2000192f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001933:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001937:	48 89 d1             	mov    %rdx,%rcx
    2000193a:	48 c1 e1 20          	shl    $0x20,%rcx
    2000193e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20001942:	89 d2                	mov    %edx,%edx
    20001944:	48 89 ce             	mov    %rcx,%rsi
    20001947:	48 09 d6             	or     %rdx,%rsi
    2000194a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    2000194e:	48 b9 00 00 00 00 1b 	movabs $0x1b00000000,%rcx
    20001955:	00 00 00 
    20001958:	48 89 d7             	mov    %rdx,%rdi
    2000195b:	48 09 cf             	or     %rcx,%rdi
    2000195e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    20001962:	48 89 d1             	mov    %rdx,%rcx
    20001965:	48 89 c2             	mov    %rax,%rdx
    20001968:	e8 80 e7 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Thd_Sched)|UVM_PARAM_D0(Cap_Sig),
                      TID, 
                      Prio);
}
    2000196d:	c9                   	leave  
    2000196e:	c3                   	ret    

000000002000196f <UVM_Thd_Sched_Rcv>:
                              is simply not allowed. 2-Level.
Output      : None.
Return      : ret_t - If successful, the thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Rcv(cid_t Cap_Thd)
{
    2000196f:	f3 0f 1e fa          	endbr64 
    20001973:	55                   	push   %rbp
    20001974:	48 89 e5             	mov    %rsp,%rbp
    20001977:	48 83 ec 10          	sub    $0x10,%rsp
    2000197b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_RCV, 0,
    2000197f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001983:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001988:	ba 00 00 00 00       	mov    $0x0,%edx
    2000198d:	48 89 c6             	mov    %rax,%rsi
    20001990:	48 b8 00 00 00 00 1c 	movabs $0x1c00000000,%rax
    20001997:	00 00 00 
    2000199a:	48 89 c7             	mov    %rax,%rdi
    2000199d:	e8 4b e7 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    200019a2:	c9                   	leave  
    200019a3:	c3                   	ret    

00000000200019a4 <UVM_Thd_Sched_Prio>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Prio(cid_t Cap_Thd, ptr_t Prio)
{
    200019a4:	f3 0f 1e fa          	endbr64 
    200019a8:	55                   	push   %rbp
    200019a9:	48 89 e5             	mov    %rsp,%rbp
    200019ac:	48 83 ec 10          	sub    $0x10,%rsp
    200019b0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200019b4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_PRIO, 0,
    200019b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200019bc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200019c0:	b9 00 00 00 00       	mov    $0x0,%ecx
    200019c5:	48 89 c6             	mov    %rax,%rsi
    200019c8:	48 b8 00 00 00 00 07 	movabs $0x700000000,%rax
    200019cf:	00 00 00 
    200019d2:	48 89 c7             	mov    %rax,%rdi
    200019d5:	e8 13 e7 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      Prio, 
                      0);
}
    200019da:	c9                   	leave  
    200019db:	c3                   	ret    

00000000200019dc <UVM_Thd_Sched_Free>:
Input       : cid_t Cap_Thd - The capability to the thread. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Free(cid_t Cap_Thd)
{
    200019dc:	f3 0f 1e fa          	endbr64 
    200019e0:	55                   	push   %rbp
    200019e1:	48 89 e5             	mov    %rsp,%rbp
    200019e4:	48 83 ec 10          	sub    $0x10,%rsp
    200019e8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_FREE, 0,
    200019ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200019f0:	b9 00 00 00 00       	mov    $0x0,%ecx
    200019f5:	ba 00 00 00 00       	mov    $0x0,%edx
    200019fa:	48 89 c6             	mov    %rax,%rsi
    200019fd:	48 b8 00 00 00 00 05 	movabs $0x500000000,%rax
    20001a04:	00 00 00 
    20001a07:	48 89 c7             	mov    %rax,%rdi
    20001a0a:	e8 de e6 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    20001a0f:	c9                   	leave  
    20001a10:	c3                   	ret    

0000000020001a11 <UVM_Thd_Time_Xfer>:
                           order of 100us or 1ms.
Output      : None.
Return      : ret_t - If successful, the destination time amount; or an error code.
******************************************************************************/
ret_t UVM_Thd_Time_Xfer(cid_t Cap_Thd_Dst, cid_t Cap_Thd_Src, ptr_t Time)
{
    20001a11:	f3 0f 1e fa          	endbr64 
    20001a15:	55                   	push   %rbp
    20001a16:	48 89 e5             	mov    %rsp,%rbp
    20001a19:	48 83 ec 20          	sub    $0x20,%rsp
    20001a1d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001a21:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001a25:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_TIME_XFER, 0,
    20001a29:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001a2d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001a31:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    20001a35:	48 89 c6             	mov    %rax,%rsi
    20001a38:	48 b8 00 00 00 00 08 	movabs $0x800000000,%rax
    20001a3f:	00 00 00 
    20001a42:	48 89 c7             	mov    %rax,%rdi
    20001a45:	e8 a3 e6 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd_Dst,
                      Cap_Thd_Src, 
                      Time);
}
    20001a4a:	c9                   	leave  
    20001a4b:	c3                   	ret    

0000000020001a4c <UVM_Thd_Swt>:
                                 this thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Swt(cid_t Cap_Thd, ptr_t Full_Yield)
{
    20001a4c:	f3 0f 1e fa          	endbr64 
    20001a50:	55                   	push   %rbp
    20001a51:	48 89 e5             	mov    %rsp,%rbp
    20001a54:	48 83 ec 10          	sub    $0x10,%rsp
    20001a58:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001a5c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SWT, 0,
    20001a60:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001a64:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001a68:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001a6d:	48 89 c6             	mov    %rax,%rsi
    20001a70:	48 b8 00 00 00 00 09 	movabs $0x900000000,%rax
    20001a77:	00 00 00 
    20001a7a:	48 89 c7             	mov    %rax,%rdi
    20001a7d:	e8 6b e6 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      Full_Yield, 
                      0);
}
    20001a82:	c9                   	leave  
    20001a83:	c3                   	ret    

0000000020001a84 <UVM_Sig_Crt>:
                            within the kernel virtual address.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Sig, ptr_t Vaddr)
{
    20001a84:	f3 0f 1e fa          	endbr64 
    20001a88:	55                   	push   %rbp
    20001a89:	48 89 e5             	mov    %rsp,%rbp
    20001a8c:	48 83 ec 20          	sub    $0x20,%rsp
    20001a90:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001a94:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001a98:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001a9c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
    20001aa0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001aa4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001aa8:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    20001aac:	48 be 00 00 00 00 1d 	movabs $0x1d00000000,%rsi
    20001ab3:	00 00 00 
    20001ab6:	48 89 cf             	mov    %rcx,%rdi
    20001ab9:	48 09 f7             	or     %rsi,%rdi
    20001abc:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    20001ac0:	48 89 c6             	mov    %rax,%rsi
    20001ac3:	e8 25 e6 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      Cap_Kmem,
                      Vaddr);
}
    20001ac8:	c9                   	leave  
    20001ac9:	c3                   	ret    

0000000020001aca <UVM_Sig_Del>:
              cid_t Cap_Sig - The capability to the signal. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Del(cid_t Cap_Captbl, cid_t Cap_Sig)
{
    20001aca:	f3 0f 1e fa          	endbr64 
    20001ace:	55                   	push   %rbp
    20001acf:	48 89 e5             	mov    %rsp,%rbp
    20001ad2:	48 83 ec 10          	sub    $0x10,%rsp
    20001ad6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001ada:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_DEL, Cap_Captbl,
    20001ade:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001ae2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001ae6:	48 b9 00 00 00 00 1e 	movabs $0x1e00000000,%rcx
    20001aed:	00 00 00 
    20001af0:	48 09 ca             	or     %rcx,%rdx
    20001af3:	48 89 d7             	mov    %rdx,%rdi
    20001af6:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001afb:	ba 00 00 00 00       	mov    $0x0,%edx
    20001b00:	48 89 c6             	mov    %rax,%rsi
    20001b03:	e8 e5 e5 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    20001b08:	c9                   	leave  
    20001b09:	c3                   	ret    

0000000020001b0a <UVM_Sig_Snd>:
Input       : cid_t Cap_Sig - The capability to the signal. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0, or an error code.
******************************************************************************/
ret_t UVM_Sig_Snd(cid_t Cap_Sig)
{
    20001b0a:	f3 0f 1e fa          	endbr64 
    20001b0e:	55                   	push   %rbp
    20001b0f:	48 89 e5             	mov    %rsp,%rbp
    20001b12:	48 83 ec 10          	sub    $0x10,%rsp
    20001b16:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_SND, 0,
    20001b1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001b1e:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001b23:	ba 00 00 00 00       	mov    $0x0,%edx
    20001b28:	48 89 c6             	mov    %rax,%rsi
    20001b2b:	48 b8 00 00 00 00 02 	movabs $0x200000000,%rax
    20001b32:	00 00 00 
    20001b35:	48 89 c7             	mov    %rax,%rdi
    20001b38:	e8 b0 e5 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    20001b3d:	c9                   	leave  
    20001b3e:	c3                   	ret    

0000000020001b3f <UVM_Sig_Rcv>:
Output      : None.
Return      : ret_t - If successful, a non-negative number containing the number of signals
                      received will be returned; else an error code.
******************************************************************************/
ret_t UVM_Sig_Rcv(cid_t Cap_Sig, ptr_t Option)
{
    20001b3f:	f3 0f 1e fa          	endbr64 
    20001b43:	55                   	push   %rbp
    20001b44:	48 89 e5             	mov    %rsp,%rbp
    20001b47:	48 83 ec 10          	sub    $0x10,%rsp
    20001b4b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001b4f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_RCV, 0,
    20001b53:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001b57:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001b5b:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001b60:	48 89 c6             	mov    %rax,%rsi
    20001b63:	48 b8 00 00 00 00 03 	movabs $0x300000000,%rax
    20001b6a:	00 00 00 
    20001b6d:	48 89 c7             	mov    %rax,%rdi
    20001b70:	e8 78 e5 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      Option, 
                      0);
}
    20001b75:	c9                   	leave  
    20001b76:	c3                   	ret    

0000000020001b77 <UVM_Inv_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, 
                  cid_t Cap_Inv, cid_t Cap_Proc, ptr_t Vaddr)
{
    20001b77:	f3 0f 1e fa          	endbr64 
    20001b7b:	55                   	push   %rbp
    20001b7c:	48 89 e5             	mov    %rsp,%rbp
    20001b7f:	48 83 ec 30          	sub    $0x30,%rsp
    20001b83:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001b87:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001b8b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001b8f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20001b93:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    20001b97:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001b9b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001b9f:	48 89 d1             	mov    %rdx,%rcx
    20001ba2:	48 c1 e1 20          	shl    $0x20,%rcx
    20001ba6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20001baa:	89 d2                	mov    %edx,%edx
    20001bac:	48 89 ce             	mov    %rcx,%rsi
    20001baf:	48 09 d6             	or     %rdx,%rsi
    20001bb2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001bb6:	48 b9 00 00 00 00 1f 	movabs $0x1f00000000,%rcx
    20001bbd:	00 00 00 
    20001bc0:	48 89 d7             	mov    %rdx,%rdi
    20001bc3:	48 09 cf             	or     %rcx,%rdi
    20001bc6:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    20001bca:	48 89 d1             	mov    %rdx,%rcx
    20001bcd:	48 89 c2             	mov    %rax,%rdx
    20001bd0:	e8 18 e5 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Inv),
                      Cap_Proc, 
                      Vaddr);
}
    20001bd5:	c9                   	leave  
    20001bd6:	c3                   	ret    

0000000020001bd7 <UVM_Inv_Del>:
              cid_t Cap_Inv - The capability to the invocation stub. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Del(cid_t Cap_Captbl, cid_t Cap_Inv)
{
    20001bd7:	f3 0f 1e fa          	endbr64 
    20001bdb:	55                   	push   %rbp
    20001bdc:	48 89 e5             	mov    %rsp,%rbp
    20001bdf:	48 83 ec 10          	sub    $0x10,%rsp
    20001be3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001be7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_DEL, Cap_Captbl,
    20001beb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001bef:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001bf3:	48 b9 00 00 00 00 20 	movabs $0x2000000000,%rcx
    20001bfa:	00 00 00 
    20001bfd:	48 09 ca             	or     %rcx,%rdx
    20001c00:	48 89 d7             	mov    %rdx,%rdi
    20001c03:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001c08:	ba 00 00 00 00       	mov    $0x0,%edx
    20001c0d:	48 89 c6             	mov    %rax,%rsi
    20001c10:	e8 d8 e4 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Inv,
                      0, 
                      0);
}
    20001c15:	c9                   	leave  
    20001c16:	c3                   	ret    

0000000020001c17 <UVM_Inv_Set>:
                                     immediately, or we wait for fault handling?
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Set(cid_t Cap_Inv, ptr_t Entry, ptr_t Stack, ptr_t Fault_Ret_Flag)
{
    20001c17:	f3 0f 1e fa          	endbr64 
    20001c1b:	55                   	push   %rbp
    20001c1c:	48 89 e5             	mov    %rsp,%rbp
    20001c1f:	48 83 ec 20          	sub    $0x20,%rsp
    20001c23:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001c27:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001c2b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001c2f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
    20001c33:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001c37:	48 c1 e0 20          	shl    $0x20,%rax
    20001c3b:	48 89 c2             	mov    %rax,%rdx
    20001c3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001c42:	89 c0                	mov    %eax,%eax
    20001c44:	48 89 d6             	mov    %rdx,%rsi
    20001c47:	48 09 c6             	or     %rax,%rsi
    20001c4a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20001c4e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001c52:	48 89 d1             	mov    %rdx,%rcx
    20001c55:	48 89 c2             	mov    %rax,%rdx
    20001c58:	48 b8 00 00 00 00 21 	movabs $0x2100000000,%rax
    20001c5f:	00 00 00 
    20001c62:	48 89 c7             	mov    %rax,%rdi
    20001c65:	e8 83 e4 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Fault_Ret_Flag)|UVM_PARAM_D0(Cap_Inv),
                      Entry, 
                      Stack);
}
    20001c6a:	c9                   	leave  
    20001c6b:	c3                   	ret    

0000000020001c6c <UVM_Putchar>:
Input       : char Char - The character to print.
Output      : None.
Return      : ptr_t - Always 0.
******************************************************************************/
ptr_t UVM_Putchar(char Char)
{
    20001c6c:	f3 0f 1e fa          	endbr64 
    20001c70:	55                   	push   %rbp
    20001c71:	48 89 e5             	mov    %rsp,%rbp
    20001c74:	48 83 ec 10          	sub    $0x10,%rsp
    20001c78:	89 f8                	mov    %edi,%eax
    20001c7a:	88 45 fc             	mov    %al,-0x4(%rbp)
    /* Wait until we have transmitted */
    while((__UVM_X64_In(UVM_X64_COM1+5)&0x20)==0);
    20001c7d:	90                   	nop
    20001c7e:	bf fd 03 00 00       	mov    $0x3fd,%edi
    20001c83:	e8 7d e3 ff ff       	call   20000005 <__UVM_X64_In>
    20001c88:	83 e0 20             	and    $0x20,%eax
    20001c8b:	48 85 c0             	test   %rax,%rax
    20001c8e:	74 ee                	je     20001c7e <UVM_Putchar+0x12>

    __UVM_X64_Out(UVM_X64_COM1, Char);
    20001c90:	48 0f be 45 fc       	movsbq -0x4(%rbp),%rax
    20001c95:	48 89 c6             	mov    %rax,%rsi
    20001c98:	bf f8 03 00 00       	mov    $0x3f8,%edi
    20001c9d:	e8 6d e3 ff ff       	call   2000000f <__UVM_X64_Out>

    return 0;
    20001ca2:	b8 00 00 00 00       	mov    $0x0,%eax
}
    20001ca7:	c9                   	leave  
    20001ca8:	c3                   	ret    

0000000020001ca9 <_UVM_Stack_Init>:
Output      : None.
Return      : ptr_t - The actual stack address to use for system call.
******************************************************************************/
ptr_t _UVM_Stack_Init(ptr_t Stack, ptr_t Size, ptr_t Stub, ptr_t Entry,
                      ptr_t Param1, ptr_t Param2, ptr_t Param3, ptr_t Param4)
{
    20001ca9:	f3 0f 1e fa          	endbr64 
    20001cad:	55                   	push   %rbp
    20001cae:	48 89 e5             	mov    %rsp,%rbp
    20001cb1:	48 83 ec 40          	sub    $0x40,%rsp
    20001cb5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    20001cb9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    20001cbd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    20001cc1:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    20001cc5:	4c 89 45 c8          	mov    %r8,-0x38(%rbp)
    20001cc9:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
	ptr_t* Stack_Ptr;

    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    20001ccd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20001cd1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001cd5:	48 01 d0             	add    %rdx,%rax
    20001cd8:	48 2d 00 01 00 00    	sub    $0x100,%rax
    20001cde:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    Stack_Ptr[0]=Param1;
    20001ce2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001ce6:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    20001cea:	48 89 10             	mov    %rdx,(%rax)
    Stack_Ptr[1]=Param2;
    20001ced:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001cf1:	48 8d 50 08          	lea    0x8(%rax),%rdx
    20001cf5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    20001cf9:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[2]=Param3;
    20001cfc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001d00:	48 8d 50 10          	lea    0x10(%rax),%rdx
    20001d04:	48 8b 45 10          	mov    0x10(%rbp),%rax
    20001d08:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[3]=Param4;
    20001d0b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001d0f:	48 8d 50 18          	lea    0x18(%rax),%rdx
    20001d13:	48 8b 45 18          	mov    0x18(%rbp),%rax
    20001d17:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[4]=Entry;
    20001d1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001d1e:	48 8d 50 20          	lea    0x20(%rax),%rdx
    20001d22:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20001d26:	48 89 02             	mov    %rax,(%rdx)

    return (ptr_t)Stack_Ptr;
    20001d29:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    20001d2d:	c9                   	leave  
    20001d2e:	c3                   	ret    

0000000020001d2f <_UVM_Idle>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void _UVM_Idle(void)
{
    20001d2f:	f3 0f 1e fa          	endbr64 
    20001d33:	55                   	push   %rbp
    20001d34:	48 89 e5             	mov    %rsp,%rbp
    /* Do nothing. In the future we may call a kernel function to put us to sleep */
}
    20001d37:	90                   	nop
    20001d38:	5d                   	pop    %rbp
    20001d39:	c3                   	ret    

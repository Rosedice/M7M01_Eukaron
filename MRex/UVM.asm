
./Object/UVM:     file format elf64-x86-64


Disassembly of section .text:

0000000020000000 <_UVM_Entry>:
              space very well.
Input       : None.
Output      : None.
*****************************************************************************/
_UVM_Entry:
    JMP                 main
    20000000:	e9 58 02 00 00       	jmp    2000025d <main>

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
    200001b5:	e8 4c 14 00 00       	call   20001606 <UVM_Thd_Swt>
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
    200001fa:	bf f8 18 00 20       	mov    $0x200018f8,%edi
    200001ff:	e8 92 0a 00 00       	call   20000c96 <UVM_Print_String>
    UVM_LOG_I(sum/1000000);
    20000204:	48 8b 05 15 1e 00 00 	mov    0x1e15(%rip),%rax        # 20002020 <sum>
    2000020b:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000212:	de 1b 43 
    20000215:	48 f7 e2             	mul    %rdx
    20000218:	48 89 d0             	mov    %rdx,%rax
    2000021b:	48 c1 e8 12          	shr    $0x12,%rax
    2000021f:	48 89 c7             	mov    %rax,%rdi
    20000222:	e8 a5 07 00 00       	call   200009cc <UVM_Print_Int>
    UVM_Thd_Swt(UVM_BOOT_TBL_THD,0);
    20000227:	be 00 00 00 00       	mov    $0x0,%esi
    2000022c:	bf 03 00 00 00       	mov    $0x3,%edi
    20000231:	e8 d0 13 00 00       	call   20001606 <UVM_Thd_Swt>
}
    20000236:	90                   	nop
    20000237:	c9                   	leave  
    20000238:	c3                   	ret    

0000000020000239 <TEST_THD2_FUNC>:

void TEST_THD2_FUNC(void)
{
    20000239:	f3 0f 1e fa          	endbr64 
    2000023d:	55                   	push   %rbp
    2000023e:	48 89 e5             	mov    %rsp,%rbp
    while(1)
    {
        UVM_Thd_Swt(TEST_THD1,0);
    20000241:	be 00 00 00 00       	mov    $0x0,%esi
    20000246:	bf 09 00 00 00       	mov    $0x9,%edi
    2000024b:	e8 b6 13 00 00       	call   20001606 <UVM_Thd_Swt>
    20000250:	eb ef                	jmp    20000241 <TEST_THD2_FUNC+0x8>

0000000020000252 <TEST_INV1_FUNC>:
    }
}

void TEST_INV1_FUNC(void){}
    20000252:	f3 0f 1e fa          	endbr64 
    20000256:	55                   	push   %rbp
    20000257:	48 89 e5             	mov    %rsp,%rbp
    2000025a:	90                   	nop
    2000025b:	5d                   	pop    %rbp
    2000025c:	c3                   	ret    

000000002000025d <main>:
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(ptr_t CPUID)
{
    2000025d:	f3 0f 1e fa          	endbr64 
    20000261:	55                   	push   %rbp
    20000262:	48 89 e5             	mov    %rsp,%rbp
    20000265:	48 83 ec 20          	sub    $0x20,%rsp
    20000269:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    ptr_t Cur_Addr;
    cnt_t Count;
    UVM_LOG_S("\r\nEnter user mode success!Welcome to RME system!");
    2000026d:	bf 20 19 00 20       	mov    $0x20001920,%edi
    20000272:	e8 1f 0a 00 00       	call   20000c96 <UVM_Print_String>
    UVM_LOG_S("\r\nNow we are running init thread on cpu:");
    20000277:	bf 58 19 00 20       	mov    $0x20001958,%edi
    2000027c:	e8 15 0a 00 00       	call   20000c96 <UVM_Print_String>
    UVM_LOG_I(CPUID);
    20000281:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000285:	48 89 c7             	mov    %rax,%rdi
    20000288:	e8 3f 07 00 00       	call   200009cc <UVM_Print_Int>
    if(CPUID==0)
    2000028d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
    20000292:	0f 85 91 06 00 00    	jne    20000929 <main+0x6cc>
    {
        /*Empty test begins here*/
        sum=0;
    20000298:	48 c7 05 7d 1d 00 00 	movq   $0x0,0x1d7d(%rip)        # 20002020 <sum>
    2000029f:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
    200002a3:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    200002aa:	00 
    200002ab:	eb 42                	jmp    200002ef <main+0x92>
        {
            start=__UVM_X64_Read_TSC();
    200002ad:	e8 69 fd ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200002b2:	48 89 05 4f 1d 00 00 	mov    %rax,0x1d4f(%rip)        # 20002008 <start>
            end=__UVM_X64_Read_TSC();
    200002b9:	e8 5d fd ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200002be:	48 89 05 53 1d 00 00 	mov    %rax,0x1d53(%rip)        # 20002018 <end>
            sum+=end-start;
    200002c5:	48 8b 05 4c 1d 00 00 	mov    0x1d4c(%rip),%rax        # 20002018 <end>
    200002cc:	48 8b 15 35 1d 00 00 	mov    0x1d35(%rip),%rdx        # 20002008 <start>
    200002d3:	48 29 d0             	sub    %rdx,%rax
    200002d6:	48 89 c1             	mov    %rax,%rcx
    200002d9:	48 8b 05 40 1d 00 00 	mov    0x1d40(%rip),%rax        # 20002020 <sum>
    200002e0:	48 01 c8             	add    %rcx,%rax
    200002e3:	48 89 05 36 1d 00 00 	mov    %rax,0x1d36(%rip)        # 20002020 <sum>
        for(Count=0;Count<1000000;Count++)
    200002ea:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    200002ef:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
    200002f6:	00 
    200002f7:	7e b4                	jle    200002ad <main+0x50>
        }
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
    200002f9:	bf 88 19 00 20       	mov    $0x20001988,%edi
    200002fe:	e8 93 09 00 00       	call   20000c96 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
    20000303:	48 8b 05 16 1d 00 00 	mov    0x1d16(%rip),%rax        # 20002020 <sum>
    2000030a:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000311:	de 1b 43 
    20000314:	48 f7 e2             	mul    %rdx
    20000317:	48 89 d0             	mov    %rdx,%rax
    2000031a:	48 c1 e8 12          	shr    $0x12,%rax
    2000031e:	48 89 c7             	mov    %rax,%rdi
    20000321:	e8 a6 06 00 00       	call   200009cc <UVM_Print_Int>
        /*Empty test ends here*/

        /*Empty system call test begins here*/
        sum=0;
    20000326:	48 c7 05 ef 1c 00 00 	movq   $0x0,0x1cef(%rip)        # 20002020 <sum>
    2000032d:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
    20000331:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    20000338:	00 
    20000339:	eb 63                	jmp    2000039e <main+0x141>
        {
            start=__UVM_X64_Read_TSC();
    2000033b:	e8 db fc ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    20000340:	48 89 05 c1 1c 00 00 	mov    %rax,0x1cc1(%rip)        # 20002008 <start>
            UVM_Svc(-1,-1,-1,-1);
    20000347:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    2000034e:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    20000355:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
    2000035c:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
    20000363:	e8 85 fd ff ff       	call   200000ed <UVM_Svc>
            end=__UVM_X64_Read_TSC();
    20000368:	e8 ae fc ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    2000036d:	48 89 05 a4 1c 00 00 	mov    %rax,0x1ca4(%rip)        # 20002018 <end>
            sum+=end-start;
    20000374:	48 8b 05 9d 1c 00 00 	mov    0x1c9d(%rip),%rax        # 20002018 <end>
    2000037b:	48 8b 15 86 1c 00 00 	mov    0x1c86(%rip),%rdx        # 20002008 <start>
    20000382:	48 29 d0             	sub    %rdx,%rax
    20000385:	48 89 c1             	mov    %rax,%rcx
    20000388:	48 8b 05 91 1c 00 00 	mov    0x1c91(%rip),%rax        # 20002020 <sum>
    2000038f:	48 01 c8             	add    %rcx,%rax
    20000392:	48 89 05 87 1c 00 00 	mov    %rax,0x1c87(%rip)        # 20002020 <sum>
        for(Count=0;Count<1000000;Count++)
    20000399:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    2000039e:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
    200003a5:	00 
    200003a6:	7e 93                	jle    2000033b <main+0xde>
        }
        UVM_LOG_S("\r\nEmpty system call takes clock cycles:");
    200003a8:	bf b0 19 00 20       	mov    $0x200019b0,%edi
    200003ad:	e8 e4 08 00 00       	call   20000c96 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
    200003b2:	48 8b 05 67 1c 00 00 	mov    0x1c67(%rip),%rax        # 20002020 <sum>
    200003b9:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    200003c0:	de 1b 43 
    200003c3:	48 f7 e2             	mul    %rdx
    200003c6:	48 89 d0             	mov    %rdx,%rax
    200003c9:	48 c1 e8 12          	shr    $0x12,%rax
    200003cd:	48 89 c7             	mov    %rax,%rdi
    200003d0:	e8 f7 05 00 00       	call   200009cc <UVM_Print_Int>
        /*Empty system call test ends here*/

        /*Now we begin to place kernel objects at this address,It must be a relative address*/
        Cur_Addr=0xFFFF800010000000ULL-0xFFFF800001600000ULL;
    200003d5:	48 c7 45 f0 00 00 a0 	movq   $0xea00000,-0x10(%rbp)
    200003dc:	0e 

        /*Thread switching test begins here*/
        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
    200003dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200003e1:	49 89 c1             	mov    %rax,%r9
    200003e4:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
    200003ea:	b9 02 00 00 00       	mov    $0x2,%ecx
    200003ef:	ba 09 00 00 00       	mov    $0x9,%edx
    200003f4:	be 00 80 05 00       	mov    $0x58000,%esi
    200003f9:	bf 00 00 00 00       	mov    $0x0,%edi
    200003fe:	e8 97 0f 00 00       	call   2000139a <UVM_Thd_Crt>
    20000403:	48 85 c0             	test   %rax,%rax
    20000406:	79 5c                	jns    20000464 <main+0x207>
    20000408:	bf d8 19 00 20       	mov    $0x200019d8,%edi
    2000040d:	e8 84 08 00 00       	call   20000c96 <UVM_Print_String>
    20000412:	bf 09 1a 00 20       	mov    $0x20001a09,%edi
    20000417:	e8 7a 08 00 00       	call   20000c96 <UVM_Print_String>
    2000041c:	bf 15 1a 00 20       	mov    $0x20001a15,%edi
    20000421:	e8 70 08 00 00       	call   20000c96 <UVM_Print_String>
    20000426:	bf 97 00 00 00       	mov    $0x97,%edi
    2000042b:	e8 9c 05 00 00       	call   200009cc <UVM_Print_Int>
    20000430:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    20000435:	e8 5c 08 00 00       	call   20000c96 <UVM_Print_String>
    2000043a:	bf 20 1a 00 20       	mov    $0x20001a20,%edi
    2000043f:	e8 52 08 00 00       	call   20000c96 <UVM_Print_String>
    20000444:	bf 2c 1a 00 20       	mov    $0x20001a2c,%edi
    20000449:	e8 48 08 00 00       	call   20000c96 <UVM_Print_String>
    2000044e:	bf 2f 1a 00 20       	mov    $0x20001a2f,%edi
    20000453:	e8 3e 08 00 00       	call   20000c96 <UVM_Print_String>
    20000458:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    2000045d:	e8 34 08 00 00       	call   20000c96 <UVM_Print_String>
    20000462:	eb fe                	jmp    20000462 <main+0x205>
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    20000464:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    2000046a:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000046f:	b8 00 00 00 80       	mov    $0x80000000,%eax
    20000474:	48 89 c2             	mov    %rax,%rdx
    20000477:	be 00 80 03 00       	mov    $0x38000,%esi
    2000047c:	bf 09 00 00 00       	mov    $0x9,%edi
    20000481:	e8 43 10 00 00       	call   200014c9 <UVM_Thd_Sched_Bind>
    20000486:	48 85 c0             	test   %rax,%rax
    20000489:	79 5c                	jns    200004e7 <main+0x28a>
    2000048b:	bf d8 19 00 20       	mov    $0x200019d8,%edi
    20000490:	e8 01 08 00 00       	call   20000c96 <UVM_Print_String>
    20000495:	bf 09 1a 00 20       	mov    $0x20001a09,%edi
    2000049a:	e8 f7 07 00 00       	call   20000c96 <UVM_Print_String>
    2000049f:	bf 15 1a 00 20       	mov    $0x20001a15,%edi
    200004a4:	e8 ed 07 00 00       	call   20000c96 <UVM_Print_String>
    200004a9:	bf 98 00 00 00       	mov    $0x98,%edi
    200004ae:	e8 19 05 00 00       	call   200009cc <UVM_Print_Int>
    200004b3:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    200004b8:	e8 d9 07 00 00       	call   20000c96 <UVM_Print_String>
    200004bd:	bf 20 1a 00 20       	mov    $0x20001a20,%edi
    200004c2:	e8 cf 07 00 00       	call   20000c96 <UVM_Print_String>
    200004c7:	bf 2c 1a 00 20       	mov    $0x20001a2c,%edi
    200004cc:	e8 c5 07 00 00       	call   20000c96 <UVM_Print_String>
    200004d1:	bf 2f 1a 00 20       	mov    $0x20001a2f,%edi
    200004d6:	e8 bb 07 00 00       	call   20000c96 <UVM_Print_String>
    200004db:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    200004e0:	e8 b1 07 00 00       	call   20000c96 <UVM_Print_String>
    200004e5:	eb fe                	jmp    200004e5 <main+0x288>
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    200004e7:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
    200004ee:	ff ff 7f 
    200004f1:	48 89 c2             	mov    %rax,%rdx
    200004f4:	be 00 80 03 00       	mov    $0x38000,%esi
    200004f9:	bf 09 00 00 00       	mov    $0x9,%edi
    200004fe:	e8 c8 10 00 00       	call   200015cb <UVM_Thd_Time_Xfer>
    20000503:	48 85 c0             	test   %rax,%rax
    20000506:	79 5c                	jns    20000564 <main+0x307>
    20000508:	bf d8 19 00 20       	mov    $0x200019d8,%edi
    2000050d:	e8 84 07 00 00       	call   20000c96 <UVM_Print_String>
    20000512:	bf 09 1a 00 20       	mov    $0x20001a09,%edi
    20000517:	e8 7a 07 00 00       	call   20000c96 <UVM_Print_String>
    2000051c:	bf 15 1a 00 20       	mov    $0x20001a15,%edi
    20000521:	e8 70 07 00 00       	call   20000c96 <UVM_Print_String>
    20000526:	bf 99 00 00 00       	mov    $0x99,%edi
    2000052b:	e8 9c 04 00 00       	call   200009cc <UVM_Print_Int>
    20000530:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    20000535:	e8 5c 07 00 00       	call   20000c96 <UVM_Print_String>
    2000053a:	bf 20 1a 00 20       	mov    $0x20001a20,%edi
    2000053f:	e8 52 07 00 00       	call   20000c96 <UVM_Print_String>
    20000544:	bf 2c 1a 00 20       	mov    $0x20001a2c,%edi
    20000549:	e8 48 07 00 00       	call   20000c96 <UVM_Print_String>
    2000054e:	bf 2f 1a 00 20       	mov    $0x20001a2f,%edi
    20000553:	e8 3e 07 00 00       	call   20000c96 <UVM_Print_String>
    20000558:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    2000055d:	e8 34 07 00 00       	call   20000c96 <UVM_Print_String>
    20000562:	eb fe                	jmp    20000562 <main+0x305>
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD1,TEST_THD1_FUNC,12*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
    20000564:	b8 7e 01 00 20       	mov    $0x2000017e,%eax
    20000569:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000056e:	ba 00 00 c0 20       	mov    $0x20c00000,%edx
    20000573:	48 89 c6             	mov    %rax,%rsi
    20000576:	bf 09 00 00 00       	mov    $0x9,%edi
    2000057b:	e8 cb 0e 00 00       	call   2000144b <UVM_Thd_Exec_Set>
    20000580:	48 85 c0             	test   %rax,%rax
    20000583:	79 5c                	jns    200005e1 <main+0x384>
    20000585:	bf d8 19 00 20       	mov    $0x200019d8,%edi
    2000058a:	e8 07 07 00 00       	call   20000c96 <UVM_Print_String>
    2000058f:	bf 09 1a 00 20       	mov    $0x20001a09,%edi
    20000594:	e8 fd 06 00 00       	call   20000c96 <UVM_Print_String>
    20000599:	bf 15 1a 00 20       	mov    $0x20001a15,%edi
    2000059e:	e8 f3 06 00 00       	call   20000c96 <UVM_Print_String>
    200005a3:	bf 9a 00 00 00       	mov    $0x9a,%edi
    200005a8:	e8 1f 04 00 00       	call   200009cc <UVM_Print_Int>
    200005ad:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    200005b2:	e8 df 06 00 00       	call   20000c96 <UVM_Print_String>
    200005b7:	bf 20 1a 00 20       	mov    $0x20001a20,%edi
    200005bc:	e8 d5 06 00 00       	call   20000c96 <UVM_Print_String>
    200005c1:	bf 2c 1a 00 20       	mov    $0x20001a2c,%edi
    200005c6:	e8 cb 06 00 00       	call   20000c96 <UVM_Print_String>
    200005cb:	bf 2f 1a 00 20       	mov    $0x20001a2f,%edi
    200005d0:	e8 c1 06 00 00       	call   20000c96 <UVM_Print_String>
    200005d5:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    200005da:	e8 b7 06 00 00       	call   20000c96 <UVM_Print_String>
    200005df:	eb fe                	jmp    200005df <main+0x382>
        Cur_Addr+=UVM_THD_SIZE;
    200005e1:	48 81 45 f0 d0 09 00 	addq   $0x9d0,-0x10(%rbp)
    200005e8:	00 

        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
    200005e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200005ed:	49 89 c1             	mov    %rax,%r9
    200005f0:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
    200005f6:	b9 02 00 00 00       	mov    $0x2,%ecx
    200005fb:	ba 0a 00 00 00       	mov    $0xa,%edx
    20000600:	be 00 80 05 00       	mov    $0x58000,%esi
    20000605:	bf 00 00 00 00       	mov    $0x0,%edi
    2000060a:	e8 8b 0d 00 00       	call   2000139a <UVM_Thd_Crt>
    2000060f:	48 85 c0             	test   %rax,%rax
    20000612:	79 5c                	jns    20000670 <main+0x413>
    20000614:	bf d8 19 00 20       	mov    $0x200019d8,%edi
    20000619:	e8 78 06 00 00       	call   20000c96 <UVM_Print_String>
    2000061e:	bf 09 1a 00 20       	mov    $0x20001a09,%edi
    20000623:	e8 6e 06 00 00       	call   20000c96 <UVM_Print_String>
    20000628:	bf 15 1a 00 20       	mov    $0x20001a15,%edi
    2000062d:	e8 64 06 00 00       	call   20000c96 <UVM_Print_String>
    20000632:	bf 9d 00 00 00       	mov    $0x9d,%edi
    20000637:	e8 90 03 00 00       	call   200009cc <UVM_Print_Int>
    2000063c:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    20000641:	e8 50 06 00 00       	call   20000c96 <UVM_Print_String>
    20000646:	bf 20 1a 00 20       	mov    $0x20001a20,%edi
    2000064b:	e8 46 06 00 00       	call   20000c96 <UVM_Print_String>
    20000650:	bf 2c 1a 00 20       	mov    $0x20001a2c,%edi
    20000655:	e8 3c 06 00 00       	call   20000c96 <UVM_Print_String>
    2000065a:	bf 2f 1a 00 20       	mov    $0x20001a2f,%edi
    2000065f:	e8 32 06 00 00       	call   20000c96 <UVM_Print_String>
    20000664:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    20000669:	e8 28 06 00 00       	call   20000c96 <UVM_Print_String>
    2000066e:	eb fe                	jmp    2000066e <main+0x411>
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
    20000670:	41 b8 00 00 00 00    	mov    $0x0,%r8d
    20000676:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000067b:	b8 00 00 00 80       	mov    $0x80000000,%eax
    20000680:	48 89 c2             	mov    %rax,%rdx
    20000683:	be 00 80 03 00       	mov    $0x38000,%esi
    20000688:	bf 0a 00 00 00       	mov    $0xa,%edi
    2000068d:	e8 37 0e 00 00       	call   200014c9 <UVM_Thd_Sched_Bind>
    20000692:	48 85 c0             	test   %rax,%rax
    20000695:	79 5c                	jns    200006f3 <main+0x496>
    20000697:	bf d8 19 00 20       	mov    $0x200019d8,%edi
    2000069c:	e8 f5 05 00 00       	call   20000c96 <UVM_Print_String>
    200006a1:	bf 09 1a 00 20       	mov    $0x20001a09,%edi
    200006a6:	e8 eb 05 00 00       	call   20000c96 <UVM_Print_String>
    200006ab:	bf 15 1a 00 20       	mov    $0x20001a15,%edi
    200006b0:	e8 e1 05 00 00       	call   20000c96 <UVM_Print_String>
    200006b5:	bf 9e 00 00 00       	mov    $0x9e,%edi
    200006ba:	e8 0d 03 00 00       	call   200009cc <UVM_Print_Int>
    200006bf:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    200006c4:	e8 cd 05 00 00       	call   20000c96 <UVM_Print_String>
    200006c9:	bf 20 1a 00 20       	mov    $0x20001a20,%edi
    200006ce:	e8 c3 05 00 00       	call   20000c96 <UVM_Print_String>
    200006d3:	bf 2c 1a 00 20       	mov    $0x20001a2c,%edi
    200006d8:	e8 b9 05 00 00       	call   20000c96 <UVM_Print_String>
    200006dd:	bf 2f 1a 00 20       	mov    $0x20001a2f,%edi
    200006e2:	e8 af 05 00 00       	call   20000c96 <UVM_Print_String>
    200006e7:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    200006ec:	e8 a5 05 00 00       	call   20000c96 <UVM_Print_String>
    200006f1:	eb fe                	jmp    200006f1 <main+0x494>
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
    200006f3:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
    200006fa:	ff ff 7f 
    200006fd:	48 89 c2             	mov    %rax,%rdx
    20000700:	be 00 80 03 00       	mov    $0x38000,%esi
    20000705:	bf 0a 00 00 00       	mov    $0xa,%edi
    2000070a:	e8 bc 0e 00 00       	call   200015cb <UVM_Thd_Time_Xfer>
    2000070f:	48 85 c0             	test   %rax,%rax
    20000712:	79 5c                	jns    20000770 <main+0x513>
    20000714:	bf d8 19 00 20       	mov    $0x200019d8,%edi
    20000719:	e8 78 05 00 00       	call   20000c96 <UVM_Print_String>
    2000071e:	bf 09 1a 00 20       	mov    $0x20001a09,%edi
    20000723:	e8 6e 05 00 00       	call   20000c96 <UVM_Print_String>
    20000728:	bf 15 1a 00 20       	mov    $0x20001a15,%edi
    2000072d:	e8 64 05 00 00       	call   20000c96 <UVM_Print_String>
    20000732:	bf 9f 00 00 00       	mov    $0x9f,%edi
    20000737:	e8 90 02 00 00       	call   200009cc <UVM_Print_Int>
    2000073c:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    20000741:	e8 50 05 00 00       	call   20000c96 <UVM_Print_String>
    20000746:	bf 20 1a 00 20       	mov    $0x20001a20,%edi
    2000074b:	e8 46 05 00 00       	call   20000c96 <UVM_Print_String>
    20000750:	bf 2c 1a 00 20       	mov    $0x20001a2c,%edi
    20000755:	e8 3c 05 00 00       	call   20000c96 <UVM_Print_String>
    2000075a:	bf 2f 1a 00 20       	mov    $0x20001a2f,%edi
    2000075f:	e8 32 05 00 00       	call   20000c96 <UVM_Print_String>
    20000764:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    20000769:	e8 28 05 00 00       	call   20000c96 <UVM_Print_String>
    2000076e:	eb fe                	jmp    2000076e <main+0x511>
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD2,TEST_THD2_FUNC,13*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,1)>=0);
    20000770:	b8 39 02 00 20       	mov    $0x20000239,%eax
    20000775:	b9 01 00 00 00       	mov    $0x1,%ecx
    2000077a:	ba 00 00 d0 20       	mov    $0x20d00000,%edx
    2000077f:	48 89 c6             	mov    %rax,%rsi
    20000782:	bf 0a 00 00 00       	mov    $0xa,%edi
    20000787:	e8 bf 0c 00 00       	call   2000144b <UVM_Thd_Exec_Set>
    2000078c:	48 85 c0             	test   %rax,%rax
    2000078f:	79 5c                	jns    200007ed <main+0x590>
    20000791:	bf d8 19 00 20       	mov    $0x200019d8,%edi
    20000796:	e8 fb 04 00 00       	call   20000c96 <UVM_Print_String>
    2000079b:	bf 09 1a 00 20       	mov    $0x20001a09,%edi
    200007a0:	e8 f1 04 00 00       	call   20000c96 <UVM_Print_String>
    200007a5:	bf 15 1a 00 20       	mov    $0x20001a15,%edi
    200007aa:	e8 e7 04 00 00       	call   20000c96 <UVM_Print_String>
    200007af:	bf a0 00 00 00       	mov    $0xa0,%edi
    200007b4:	e8 13 02 00 00       	call   200009cc <UVM_Print_Int>
    200007b9:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    200007be:	e8 d3 04 00 00       	call   20000c96 <UVM_Print_String>
    200007c3:	bf 20 1a 00 20       	mov    $0x20001a20,%edi
    200007c8:	e8 c9 04 00 00       	call   20000c96 <UVM_Print_String>
    200007cd:	bf 2c 1a 00 20       	mov    $0x20001a2c,%edi
    200007d2:	e8 bf 04 00 00       	call   20000c96 <UVM_Print_String>
    200007d7:	bf 2f 1a 00 20       	mov    $0x20001a2f,%edi
    200007dc:	e8 b5 04 00 00       	call   20000c96 <UVM_Print_String>
    200007e1:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    200007e6:	e8 ab 04 00 00       	call   20000c96 <UVM_Print_String>
    200007eb:	eb fe                	jmp    200007eb <main+0x58e>
        Cur_Addr+=UVM_THD_SIZE;
    200007ed:	48 81 45 f0 d0 09 00 	addq   $0x9d0,-0x10(%rbp)
    200007f4:	00 

        UVM_Thd_Swt(TEST_THD1,0);
    200007f5:	be 00 00 00 00       	mov    $0x0,%esi
    200007fa:	bf 09 00 00 00       	mov    $0x9,%edi
    200007ff:	e8 02 0e 00 00       	call   20001606 <UVM_Thd_Swt>
        UVM_LOG_S("\r\nExit THD1!");
    20000804:	bf 38 1a 00 20       	mov    $0x20001a38,%edi
    20000809:	e8 88 04 00 00       	call   20000c96 <UVM_Print_String>
        /*Thread switching test ends here*/

        /*Signal send test begins here*/
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
    2000080e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000812:	48 89 c1             	mov    %rax,%rcx
    20000815:	ba 0c 00 00 00       	mov    $0xc,%edx
    2000081a:	be 00 80 05 00       	mov    $0x58000,%esi
    2000081f:	bf 00 00 00 00       	mov    $0x0,%edi
    20000824:	e8 15 0e 00 00       	call   2000163e <UVM_Sig_Crt>
    20000829:	48 85 c0             	test   %rax,%rax
    2000082c:	79 5c                	jns    2000088a <main+0x62d>
    2000082e:	bf d8 19 00 20       	mov    $0x200019d8,%edi
    20000833:	e8 5e 04 00 00       	call   20000c96 <UVM_Print_String>
    20000838:	bf 09 1a 00 20       	mov    $0x20001a09,%edi
    2000083d:	e8 54 04 00 00       	call   20000c96 <UVM_Print_String>
    20000842:	bf 15 1a 00 20       	mov    $0x20001a15,%edi
    20000847:	e8 4a 04 00 00       	call   20000c96 <UVM_Print_String>
    2000084c:	bf a8 00 00 00       	mov    $0xa8,%edi
    20000851:	e8 76 01 00 00       	call   200009cc <UVM_Print_Int>
    20000856:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    2000085b:	e8 36 04 00 00       	call   20000c96 <UVM_Print_String>
    20000860:	bf 20 1a 00 20       	mov    $0x20001a20,%edi
    20000865:	e8 2c 04 00 00       	call   20000c96 <UVM_Print_String>
    2000086a:	bf 2c 1a 00 20       	mov    $0x20001a2c,%edi
    2000086f:	e8 22 04 00 00       	call   20000c96 <UVM_Print_String>
    20000874:	bf 2f 1a 00 20       	mov    $0x20001a2f,%edi
    20000879:	e8 18 04 00 00       	call   20000c96 <UVM_Print_String>
    2000087e:	bf 1d 1a 00 20       	mov    $0x20001a1d,%edi
    20000883:	e8 0e 04 00 00       	call   20000c96 <UVM_Print_String>
    20000888:	eb fe                	jmp    20000888 <main+0x62b>
        Cur_Addr+=UVM_SIG_SIZE;
    2000088a:	48 83 45 f0 20       	addq   $0x20,-0x10(%rbp)
        sum=0;
    2000088f:	48 c7 05 86 17 00 00 	movq   $0x0,0x1786(%rip)        # 20002020 <sum>
    20000896:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
    2000089a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    200008a1:	00 
    200008a2:	eb 4c                	jmp    200008f0 <main+0x693>
        {
            start=__UVM_X64_Read_TSC();
    200008a4:	e8 72 f7 ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200008a9:	48 89 05 58 17 00 00 	mov    %rax,0x1758(%rip)        # 20002008 <start>
            UVM_Sig_Snd(TEST_SIG1);
    200008b0:	bf 0c 00 00 00       	mov    $0xc,%edi
    200008b5:	e8 0a 0e 00 00       	call   200016c4 <UVM_Sig_Snd>
            end=__UVM_X64_Read_TSC();
    200008ba:	e8 5c f7 ff ff       	call   2000001b <__UVM_X64_Read_TSC>
    200008bf:	48 89 05 52 17 00 00 	mov    %rax,0x1752(%rip)        # 20002018 <end>
            sum+=end-start;
    200008c6:	48 8b 05 4b 17 00 00 	mov    0x174b(%rip),%rax        # 20002018 <end>
    200008cd:	48 8b 15 34 17 00 00 	mov    0x1734(%rip),%rdx        # 20002008 <start>
    200008d4:	48 29 d0             	sub    %rdx,%rax
    200008d7:	48 89 c1             	mov    %rax,%rcx
    200008da:	48 8b 05 3f 17 00 00 	mov    0x173f(%rip),%rax        # 20002020 <sum>
    200008e1:	48 01 c8             	add    %rcx,%rax
    200008e4:	48 89 05 35 17 00 00 	mov    %rax,0x1735(%rip)        # 20002020 <sum>
        for(Count=0;Count<1000000;Count++)
    200008eb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    200008f0:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
    200008f7:	00 
    200008f8:	7e aa                	jle    200008a4 <main+0x647>
        }
        UVM_LOG_S("\r\nSignal send takes clock cycles:");
    200008fa:	bf 48 1a 00 20       	mov    $0x20001a48,%edi
    200008ff:	e8 92 03 00 00       	call   20000c96 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
    20000904:	48 8b 05 15 17 00 00 	mov    0x1715(%rip),%rax        # 20002020 <sum>
    2000090b:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
    20000912:	de 1b 43 
    20000915:	48 f7 e2             	mul    %rdx
    20000918:	48 89 d0             	mov    %rdx,%rax
    2000091b:	48 c1 e8 12          	shr    $0x12,%rax
    2000091f:	48 89 c7             	mov    %rax,%rdi
    20000922:	e8 a5 00 00 00       	call   200009cc <UVM_Print_Int>
        while (1);
    20000927:	eb fe                	jmp    20000927 <main+0x6ca>
    /* Run some simple benchmarks *//*
core-local ctxsw wrt.cores
core-local IPC wrt.cores
map/unmap pages wrt.cores
WCIRT*/
    while (1);
    20000929:	eb fe                	jmp    20000929 <main+0x6cc>

000000002000092b <UVM_List_Crt>:
Input       : volatile struct UVM_List* Head - The pointer to the list head.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Crt(volatile struct UVM_List* Head)
{
    2000092b:	f3 0f 1e fa          	endbr64 
    2000092f:	55                   	push   %rbp
    20000930:	48 89 e5             	mov    %rsp,%rbp
    20000933:	48 83 ec 08          	sub    $0x8,%rsp
    20000937:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    Head->Prev=(struct UVM_List*)Head;
    2000093b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000093f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000943:	48 89 10             	mov    %rdx,(%rax)
    Head->Next=(struct UVM_List*)Head;
    20000946:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000094a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    2000094e:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
    20000952:	90                   	nop
    20000953:	c9                   	leave  
    20000954:	c3                   	ret    

0000000020000955 <UVM_List_Del>:
              volatile struct UVM_List* Next - The next node of the target node.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Del(volatile struct UVM_List* Prev,volatile struct UVM_List* Next)
{
    20000955:	f3 0f 1e fa          	endbr64 
    20000959:	55                   	push   %rbp
    2000095a:	48 89 e5             	mov    %rsp,%rbp
    2000095d:	48 83 ec 10          	sub    $0x10,%rsp
    20000961:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000965:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    Next->Prev=(struct UVM_List*)Prev;
    20000969:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000096d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000971:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)Next;
    20000974:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000978:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000097c:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
    20000980:	90                   	nop
    20000981:	c9                   	leave  
    20000982:	c3                   	ret    

0000000020000983 <UVM_List_Ins>:
Return      : None.
******************************************************************************/
void UVM_List_Ins(volatile struct UVM_List* New,
                  volatile struct UVM_List* Prev,
                  volatile struct UVM_List* Next)
{
    20000983:	f3 0f 1e fa          	endbr64 
    20000987:	55                   	push   %rbp
    20000988:	48 89 e5             	mov    %rsp,%rbp
    2000098b:	48 83 ec 18          	sub    $0x18,%rsp
    2000098f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000993:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000997:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    Next->Prev=(struct UVM_List*)New;
    2000099b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2000099f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200009a3:	48 89 10             	mov    %rdx,(%rax)
    New->Next=(struct UVM_List*)Next;
    200009a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200009aa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    200009ae:	48 89 50 08          	mov    %rdx,0x8(%rax)
    New->Prev=(struct UVM_List*)Prev;
    200009b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200009b6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200009ba:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)New;
    200009bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200009c1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200009c5:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
    200009c9:	90                   	nop
    200009ca:	c9                   	leave  
    200009cb:	c3                   	ret    

00000000200009cc <UVM_Print_Int>:
Input       : cnt_t Int - The integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Int(cnt_t Int)
{
    200009cc:	f3 0f 1e fa          	endbr64 
    200009d0:	55                   	push   %rbp
    200009d1:	48 89 e5             	mov    %rsp,%rbp
    200009d4:	48 83 ec 30          	sub    $0x30,%rsp
    200009d8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    cnt_t Count;
    cnt_t Num;
    ptr_t Div;
    
    /* how many digits are there? */
    if(Int==0)
    200009dc:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    200009e1:	75 14                	jne    200009f7 <UVM_Print_Int+0x2b>
    {
        UVM_Putchar('0');
    200009e3:	bf 30 00 00 00       	mov    $0x30,%edi
    200009e8:	e8 39 0e 00 00       	call   20001826 <UVM_Putchar>
        return 1;
    200009ed:	b8 01 00 00 00       	mov    $0x1,%eax
    200009f2:	e9 d8 01 00 00       	jmp    20000bcf <UVM_Print_Int+0x203>
    }
    else if(Int<0)
    200009f7:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    200009fc:	0f 89 f1 00 00 00    	jns    20000af3 <UVM_Print_Int+0x127>
    {
        /* How many digits are there? */
        Count=0;
    20000a02:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    20000a09:	00 
        Div=1;
    20000a0a:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
    20000a11:	00 
        Iter=-Int;
    20000a12:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000a16:	48 f7 d8             	neg    %rax
    20000a19:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
    20000a1d:	eb 36                	jmp    20000a55 <UVM_Print_Int+0x89>
        {
            Iter/=10;
    20000a1f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000a23:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000a2a:	cc cc cc 
    20000a2d:	48 f7 e2             	mul    %rdx
    20000a30:	48 89 d0             	mov    %rdx,%rax
    20000a33:	48 c1 e8 03          	shr    $0x3,%rax
    20000a37:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
    20000a3b:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
    20000a40:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000a44:	48 89 d0             	mov    %rdx,%rax
    20000a47:	48 c1 e0 02          	shl    $0x2,%rax
    20000a4b:	48 01 d0             	add    %rdx,%rax
    20000a4e:	48 01 c0             	add    %rax,%rax
    20000a51:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
    20000a55:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    20000a5a:	75 c3                	jne    20000a1f <UVM_Print_Int+0x53>
        }
        Div/=10;
    20000a5c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000a60:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000a67:	cc cc cc 
    20000a6a:	48 f7 e2             	mul    %rdx
    20000a6d:	48 89 d0             	mov    %rdx,%rax
    20000a70:	48 c1 e8 03          	shr    $0x3,%rax
    20000a74:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        UVM_Putchar('-');
    20000a78:	bf 2d 00 00 00       	mov    $0x2d,%edi
    20000a7d:	e8 a4 0d 00 00       	call   20001826 <UVM_Putchar>
        Iter=-Int;
    20000a82:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000a86:	48 f7 d8             	neg    %rax
    20000a89:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count+1;
    20000a8d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000a91:	48 83 c0 01          	add    $0x1,%rax
    20000a95:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
    20000a99:	eb 4c                	jmp    20000ae7 <UVM_Print_Int+0x11b>
        {
            Count--;
    20000a9b:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
    20000aa0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000aa4:	ba 00 00 00 00       	mov    $0x0,%edx
    20000aa9:	48 f7 75 e0          	divq   -0x20(%rbp)
    20000aad:	83 c0 30             	add    $0x30,%eax
    20000ab0:	0f be c0             	movsbl %al,%eax
    20000ab3:	89 c7                	mov    %eax,%edi
    20000ab5:	e8 6c 0d 00 00       	call   20001826 <UVM_Putchar>
            Iter=Iter%Div;
    20000aba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000abe:	ba 00 00 00 00       	mov    $0x0,%edx
    20000ac3:	48 f7 75 e0          	divq   -0x20(%rbp)
    20000ac7:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
    20000acb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000acf:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000ad6:	cc cc cc 
    20000ad9:	48 f7 e2             	mul    %rdx
    20000adc:	48 89 d0             	mov    %rdx,%rax
    20000adf:	48 c1 e8 03          	shr    $0x3,%rax
    20000ae3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
    20000ae7:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    20000aec:	7f ad                	jg     20000a9b <UVM_Print_Int+0xcf>
    20000aee:	e9 d8 00 00 00       	jmp    20000bcb <UVM_Print_Int+0x1ff>
        }
    }
    else
    {
        /* How many digits are there? */
        Count=0;
    20000af3:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    20000afa:	00 
        Div=1;
    20000afb:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
    20000b02:	00 
        Iter=Int;
    20000b03:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000b07:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
    20000b0b:	eb 36                	jmp    20000b43 <UVM_Print_Int+0x177>
        {
            Iter/=10;
    20000b0d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000b11:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000b18:	cc cc cc 
    20000b1b:	48 f7 e2             	mul    %rdx
    20000b1e:	48 89 d0             	mov    %rdx,%rax
    20000b21:	48 c1 e8 03          	shr    $0x3,%rax
    20000b25:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
    20000b29:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
    20000b2e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000b32:	48 89 d0             	mov    %rdx,%rax
    20000b35:	48 c1 e0 02          	shl    $0x2,%rax
    20000b39:	48 01 d0             	add    %rdx,%rax
    20000b3c:	48 01 c0             	add    %rax,%rax
    20000b3f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
    20000b43:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    20000b48:	75 c3                	jne    20000b0d <UVM_Print_Int+0x141>
        }
        Div/=10;
    20000b4a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000b4e:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000b55:	cc cc cc 
    20000b58:	48 f7 e2             	mul    %rdx
    20000b5b:	48 89 d0             	mov    %rdx,%rax
    20000b5e:	48 c1 e8 03          	shr    $0x3,%rax
    20000b62:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        Iter=Int;
    20000b66:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000b6a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count;
    20000b6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000b72:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
    20000b76:	eb 4c                	jmp    20000bc4 <UVM_Print_Int+0x1f8>
        {
            Count--;
    20000b78:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
    20000b7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000b81:	ba 00 00 00 00       	mov    $0x0,%edx
    20000b86:	48 f7 75 e0          	divq   -0x20(%rbp)
    20000b8a:	83 c0 30             	add    $0x30,%eax
    20000b8d:	0f be c0             	movsbl %al,%eax
    20000b90:	89 c7                	mov    %eax,%edi
    20000b92:	e8 8f 0c 00 00       	call   20001826 <UVM_Putchar>
            Iter=Iter%Div;
    20000b97:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000b9b:	ba 00 00 00 00       	mov    $0x0,%edx
    20000ba0:	48 f7 75 e0          	divq   -0x20(%rbp)
    20000ba4:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
    20000ba8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000bac:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    20000bb3:	cc cc cc 
    20000bb6:	48 f7 e2             	mul    %rdx
    20000bb9:	48 89 d0             	mov    %rdx,%rax
    20000bbc:	48 c1 e8 03          	shr    $0x3,%rax
    20000bc0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
    20000bc4:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    20000bc9:	7f ad                	jg     20000b78 <UVM_Print_Int+0x1ac>
        }
    }
    
    return Num;
    20000bcb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
    20000bcf:	c9                   	leave  
    20000bd0:	c3                   	ret    

0000000020000bd1 <UVM_Print_Uint>:
Input       : ptr_t Uint - The unsigned integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Uint(ptr_t Uint)
{
    20000bd1:	f3 0f 1e fa          	endbr64 
    20000bd5:	55                   	push   %rbp
    20000bd6:	48 89 e5             	mov    %rsp,%rbp
    20000bd9:	48 83 ec 30          	sub    $0x30,%rsp
    20000bdd:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    ptr_t Iter;
    cnt_t Count;
    cnt_t Num;
    
    /* how many digits are there? */
    if(Uint==0)
    20000be1:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    20000be6:	75 14                	jne    20000bfc <UVM_Print_Uint+0x2b>
    {
        UVM_Putchar('0');
    20000be8:	bf 30 00 00 00       	mov    $0x30,%edi
    20000bed:	e8 34 0c 00 00       	call   20001826 <UVM_Putchar>
        return 1;
    20000bf2:	b8 01 00 00 00       	mov    $0x1,%eax
    20000bf7:	e9 98 00 00 00       	jmp    20000c94 <UVM_Print_Uint+0xc3>
    }
    else
    {
        /* Filter out all the zeroes */
        Count=0;
    20000bfc:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    20000c03:	00 
        Iter=Uint;
    20000c04:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000c08:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    20000c0c:	eb 0a                	jmp    20000c18 <UVM_Print_Uint+0x47>
        {
            Iter<<=4;
    20000c0e:	48 c1 65 f8 04       	shlq   $0x4,-0x8(%rbp)
            Count++;
    20000c13:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    20000c18:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000c1c:	48 c1 e8 3c          	shr    $0x3c,%rax
    20000c20:	48 85 c0             	test   %rax,%rax
    20000c23:	74 e9                	je     20000c0e <UVM_Print_Uint+0x3d>
        }
        /* Count is the number of pts to print */
        Count=sizeof(ptr_t)*2-Count;
    20000c25:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20000c29:	b8 10 00 00 00       	mov    $0x10,%eax
    20000c2e:	48 29 d0             	sub    %rdx,%rax
    20000c31:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        Num=Count;
    20000c35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000c39:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        while(Count>0)
    20000c3d:	eb 4a                	jmp    20000c89 <UVM_Print_Uint+0xb8>
        {
            Count--;
    20000c3f:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            Iter=(Uint>>(Count*4))&0x0F;
    20000c44:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000c48:	c1 e0 02             	shl    $0x2,%eax
    20000c4b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    20000c4f:	89 c1                	mov    %eax,%ecx
    20000c51:	48 d3 ea             	shr    %cl,%rdx
    20000c54:	48 89 d0             	mov    %rdx,%rax
    20000c57:	83 e0 0f             	and    $0xf,%eax
    20000c5a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            if(Iter<10)
    20000c5e:	48 83 7d f8 09       	cmpq   $0x9,-0x8(%rbp)
    20000c63:	77 13                	ja     20000c78 <UVM_Print_Uint+0xa7>
                UVM_Putchar('0'+Iter);
    20000c65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000c69:	83 c0 30             	add    $0x30,%eax
    20000c6c:	0f be c0             	movsbl %al,%eax
    20000c6f:	89 c7                	mov    %eax,%edi
    20000c71:	e8 b0 0b 00 00       	call   20001826 <UVM_Putchar>
    20000c76:	eb 11                	jmp    20000c89 <UVM_Print_Uint+0xb8>
            else
                UVM_Putchar('A'+Iter-10);
    20000c78:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000c7c:	83 c0 37             	add    $0x37,%eax
    20000c7f:	0f be c0             	movsbl %al,%eax
    20000c82:	89 c7                	mov    %eax,%edi
    20000c84:	e8 9d 0b 00 00       	call   20001826 <UVM_Putchar>
        while(Count>0)
    20000c89:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    20000c8e:	7f af                	jg     20000c3f <UVM_Print_Uint+0x6e>
        }
    }
    
    return Num;
    20000c90:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
    20000c94:	c9                   	leave  
    20000c95:	c3                   	ret    

0000000020000c96 <UVM_Print_String>:
Input       : s8* String - The string to print.
Output      : None.
Return      : cnt_t - The length of the string printed, the '\0' is not included.
******************************************************************************/
cnt_t UVM_Print_String(s8* String)
{
    20000c96:	f3 0f 1e fa          	endbr64 
    20000c9a:	55                   	push   %rbp
    20000c9b:	48 89 e5             	mov    %rsp,%rbp
    20000c9e:	48 83 ec 20          	sub    $0x20,%rsp
    20000ca2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    cnt_t Count;
    
    Count=0;
    20000ca6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    20000cad:	00 
    while(Count<UVM_USER_DEBUG_MAX_STR)
    20000cae:	eb 35                	jmp    20000ce5 <UVM_Print_String+0x4f>
    {
        if(String[Count]=='\0')
    20000cb0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000cb4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000cb8:	48 01 d0             	add    %rdx,%rax
    20000cbb:	0f b6 00             	movzbl (%rax),%eax
    20000cbe:	84 c0                	test   %al,%al
    20000cc0:	74 2c                	je     20000cee <UVM_Print_String+0x58>
            break;
        
        UVM_Putchar(String[Count++]);
    20000cc2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000cc6:	48 8d 50 01          	lea    0x1(%rax),%rdx
    20000cca:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    20000cce:	48 89 c2             	mov    %rax,%rdx
    20000cd1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000cd5:	48 01 d0             	add    %rdx,%rax
    20000cd8:	0f b6 00             	movzbl (%rax),%eax
    20000cdb:	0f be c0             	movsbl %al,%eax
    20000cde:	89 c7                	mov    %eax,%edi
    20000ce0:	e8 41 0b 00 00       	call   20001826 <UVM_Putchar>
    while(Count<UVM_USER_DEBUG_MAX_STR)
    20000ce5:	48 83 7d f8 7f       	cmpq   $0x7f,-0x8(%rbp)
    20000cea:	7e c4                	jle    20000cb0 <UVM_Print_String+0x1a>
    20000cec:	eb 01                	jmp    20000cef <UVM_Print_String+0x59>
            break;
    20000cee:	90                   	nop
    }
    
    return Count;
    20000cef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    20000cf3:	c9                   	leave  
    20000cf4:	c3                   	ret    

0000000020000cf5 <UVM_Captbl_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, 
                     cid_t Cap_Captbl, ptr_t Vaddr, ptr_t Entry_Num)
{
    20000cf5:	f3 0f 1e fa          	endbr64 
    20000cf9:	55                   	push   %rbp
    20000cfa:	48 89 e5             	mov    %rsp,%rbp
    20000cfd:	48 83 ec 30          	sub    $0x30,%rsp
    20000d01:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000d05:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000d09:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000d0d:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000d11:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
    20000d15:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000d19:	48 c1 e0 20          	shl    $0x20,%rax
    20000d1d:	48 89 c2             	mov    %rax,%rdx
    20000d20:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000d24:	89 c0                	mov    %eax,%eax
    20000d26:	48 89 d6             	mov    %rdx,%rsi
    20000d29:	48 09 c6             	or     %rax,%rsi
    20000d2c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000d30:	48 ba 00 00 00 00 0a 	movabs $0xa00000000,%rdx
    20000d37:	00 00 00 
    20000d3a:	48 09 d0             	or     %rdx,%rax
    20000d3d:	48 89 c7             	mov    %rax,%rdi
    20000d40:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    20000d44:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000d48:	48 89 d1             	mov    %rdx,%rcx
    20000d4b:	48 89 c2             	mov    %rax,%rdx
    20000d4e:	e8 9a f3 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Captbl),
                      Vaddr,
                      Entry_Num);
}
    20000d53:	c9                   	leave  
    20000d54:	c3                   	ret    

0000000020000d55 <UVM_Captbl_Del>:
              cid_t Cap_Del - The capability to the capability table to be deleted. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Del(cid_t Cap_Captbl_Del, cid_t Cap_Del)
{
    20000d55:	f3 0f 1e fa          	endbr64 
    20000d59:	55                   	push   %rbp
    20000d5a:	48 89 e5             	mov    %rsp,%rbp
    20000d5d:	48 83 ec 10          	sub    $0x10,%rsp
    20000d61:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000d65:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_DEL, Cap_Captbl_Del,
    20000d69:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000d6d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000d71:	48 b9 00 00 00 00 0b 	movabs $0xb00000000,%rcx
    20000d78:	00 00 00 
    20000d7b:	48 09 ca             	or     %rcx,%rdx
    20000d7e:	48 89 d7             	mov    %rdx,%rdi
    20000d81:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000d86:	ba 00 00 00 00       	mov    $0x0,%edx
    20000d8b:	48 89 c6             	mov    %rax,%rsi
    20000d8e:	e8 5a f3 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Del,
                      0,
                      0);
}
    20000d93:	c9                   	leave  
    20000d94:	c3                   	ret    

0000000020000d95 <UVM_Captbl_Frz>:
              cid_t Cap_Frz - The cap to the kernel object being freezed. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Frz(cid_t Cap_Captbl_Frz, cid_t Cap_Frz)
{
    20000d95:	f3 0f 1e fa          	endbr64 
    20000d99:	55                   	push   %rbp
    20000d9a:	48 89 e5             	mov    %rsp,%rbp
    20000d9d:	48 83 ec 10          	sub    $0x10,%rsp
    20000da1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000da5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
        return UVM_CAP_OP(RME_SVC_CPT_FRZ, Cap_Captbl_Frz,
    20000da9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000dad:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000db1:	48 b9 00 00 00 00 0c 	movabs $0xc00000000,%rcx
    20000db8:	00 00 00 
    20000dbb:	48 09 ca             	or     %rcx,%rdx
    20000dbe:	48 89 d7             	mov    %rdx,%rdi
    20000dc1:	b9 00 00 00 00       	mov    $0x0,%ecx
    20000dc6:	ba 00 00 00 00       	mov    $0x0,%edx
    20000dcb:	48 89 c6             	mov    %rax,%rsi
    20000dce:	e8 1a f3 ff ff       	call   200000ed <UVM_Svc>
                          Cap_Frz,
                          0,
                          0);
}
    20000dd3:	c9                   	leave  
    20000dd4:	c3                   	ret    

0000000020000dd5 <UVM_Captbl_Add>:
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Add(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                     cid_t Cap_Captbl_Src, cid_t Cap_Src, ptr_t Flags)
{
    20000dd5:	f3 0f 1e fa          	endbr64 
    20000dd9:	55                   	push   %rbp
    20000dda:	48 89 e5             	mov    %rsp,%rbp
    20000ddd:	48 83 ec 30          	sub    $0x30,%rsp
    20000de1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000de5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000de9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000ded:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000df1:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20000df5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000df9:	48 c1 e0 20          	shl    $0x20,%rax
    20000dfd:	48 89 c2             	mov    %rax,%rdx
    20000e00:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000e04:	89 c0                	mov    %eax,%eax
    20000e06:	48 09 c2             	or     %rax,%rdx
    20000e09:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000e0d:	48 c1 e0 20          	shl    $0x20,%rax
    20000e11:	48 89 c1             	mov    %rax,%rcx
    20000e14:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000e18:	89 c0                	mov    %eax,%eax
    20000e1a:	48 09 c1             	or     %rax,%rcx
    20000e1d:	48 89 ce             	mov    %rcx,%rsi
    20000e20:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000e24:	48 89 c1             	mov    %rax,%rcx
    20000e27:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20000e2e:	00 00 00 
    20000e31:	48 89 c7             	mov    %rax,%rdi
    20000e34:	e8 b4 f2 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),Flags);
}
    20000e39:	c9                   	leave  
    20000e3a:	c3                   	ret    

0000000020000e3b <UVM_Captbl_Pgtbl>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Pgtbl(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                       cid_t Cap_Captbl_Src, cid_t Cap_Src,
                       ptr_t Start, ptr_t End, ptr_t Flags)
{
    20000e3b:	f3 0f 1e fa          	endbr64 
    20000e3f:	55                   	push   %rbp
    20000e40:	48 89 e5             	mov    %rsp,%rbp
    20000e43:	48 83 ec 30          	sub    $0x30,%rsp
    20000e47:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000e4b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000e4f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000e53:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000e57:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20000e5b:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20000e5f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20000e63:	48 c1 e0 24          	shl    $0x24,%rax
    20000e67:	48 89 c2             	mov    %rax,%rdx
    20000e6a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000e6e:	48 c1 e0 08          	shl    $0x8,%rax
    20000e72:	48 09 d0             	or     %rdx,%rax
    20000e75:	48 0b 45 10          	or     0x10(%rbp),%rax
    20000e79:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20000e7d:	48 89 d1             	mov    %rdx,%rcx
    20000e80:	48 c1 e1 20          	shl    $0x20,%rcx
    20000e84:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000e88:	89 d2                	mov    %edx,%edx
    20000e8a:	48 09 ca             	or     %rcx,%rdx
    20000e8d:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    20000e91:	48 89 ce             	mov    %rcx,%rsi
    20000e94:	48 c1 e6 20          	shl    $0x20,%rsi
    20000e98:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    20000e9c:	89 c9                	mov    %ecx,%ecx
    20000e9e:	48 09 ce             	or     %rcx,%rsi
    20000ea1:	48 89 c1             	mov    %rax,%rcx
    20000ea4:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20000eab:	00 00 00 
    20000eae:	48 89 c7             	mov    %rax,%rdi
    20000eb1:	e8 37 f2 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_PGTBL_FLAG(End,Start,Flags));
}
    20000eb6:	c9                   	leave  
    20000eb7:	c3                   	ret    

0000000020000eb8 <UVM_Captbl_Kern>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kern(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End)
{
    20000eb8:	f3 0f 1e fa          	endbr64 
    20000ebc:	55                   	push   %rbp
    20000ebd:	48 89 e5             	mov    %rsp,%rbp
    20000ec0:	48 83 ec 30          	sub    $0x30,%rsp
    20000ec4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000ec8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000ecc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000ed0:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000ed4:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20000ed8:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    20000edc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20000ee0:	48 c1 e0 20          	shl    $0x20,%rax
    20000ee4:	48 0b 45 d8          	or     -0x28(%rbp),%rax
    20000ee8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20000eec:	48 c1 e2 20          	shl    $0x20,%rdx
    20000ef0:	48 89 d1             	mov    %rdx,%rcx
    20000ef3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20000ef7:	89 d2                	mov    %edx,%edx
    20000ef9:	48 09 ca             	or     %rcx,%rdx
    20000efc:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    20000f00:	48 89 ce             	mov    %rcx,%rsi
    20000f03:	48 c1 e6 20          	shl    $0x20,%rsi
    20000f07:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    20000f0b:	89 c9                	mov    %ecx,%ecx
    20000f0d:	48 09 ce             	or     %rcx,%rsi
    20000f10:	48 89 c1             	mov    %rax,%rcx
    20000f13:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20000f1a:	00 00 00 
    20000f1d:	48 89 c7             	mov    %rax,%rdi
    20000f20:	e8 c8 f1 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KERN_FLAG(End,Start));
}
    20000f25:	c9                   	leave  
    20000f26:	c3                   	ret    

0000000020000f27 <UVM_Captbl_Kmem>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kmem(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End, ptr_t Flags)
{
    20000f27:	f3 0f 1e fa          	endbr64 
    20000f2b:	55                   	push   %rbp
    20000f2c:	48 89 e5             	mov    %rsp,%rbp
    20000f2f:	48 83 ec 30          	sub    $0x30,%rsp
    20000f33:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000f37:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20000f3b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20000f3f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20000f43:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20000f47:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(UVM_KMEM_SVC(End,RME_SVC_CPT_ADD), UVM_KMEM_CAPID(Start,Flags),
    20000f4b:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
    20000f52:	ff ff ff 
    20000f55:	48 23 45 d0          	and    -0x30(%rbp),%rax
    20000f59:	48 89 c2             	mov    %rax,%rdx
    20000f5c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000f60:	48 c1 e8 20          	shr    $0x20,%rax
    20000f64:	48 89 d1             	mov    %rdx,%rcx
    20000f67:	48 09 c1             	or     %rax,%rcx
    20000f6a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20000f6e:	48 c1 e0 20          	shl    $0x20,%rax
    20000f72:	48 89 c2             	mov    %rax,%rdx
    20000f75:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20000f79:	89 c0                	mov    %eax,%eax
    20000f7b:	48 09 c2             	or     %rax,%rdx
    20000f7e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20000f82:	48 c1 e0 20          	shl    $0x20,%rax
    20000f86:	48 89 c6             	mov    %rax,%rsi
    20000f89:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000f8d:	89 c0                	mov    %eax,%eax
    20000f8f:	48 09 c6             	or     %rax,%rsi
    20000f92:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20000f96:	48 c1 e8 06          	shr    $0x6,%rax
    20000f9a:	48 c1 e0 26          	shl    $0x26,%rax
    20000f9e:	48 89 c7             	mov    %rax,%rdi
    20000fa1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20000fa5:	48 c1 e8 06          	shr    $0x6,%rax
    20000fa9:	48 c1 e0 26          	shl    $0x26,%rax
    20000fad:	48 c1 e8 20          	shr    $0x20,%rax
    20000fb1:	48 0b 45 10          	or     0x10(%rbp),%rax
    20000fb5:	48 09 c7             	or     %rax,%rdi
    20000fb8:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    20000fbf:	00 00 00 
    20000fc2:	48 09 f8             	or     %rdi,%rax
    20000fc5:	48 89 c7             	mov    %rax,%rdi
    20000fc8:	e8 20 f1 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KMEM_FLAG(End,Start));
}
    20000fcd:	c9                   	leave  
    20000fce:	c3                   	ret    

0000000020000fcf <UVM_Captbl_Rem>:
              cid_t Cap_Rem - The capability slot you want to remove. 1-Level.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Rem(cid_t Cap_Captbl_Rem, cid_t Cap_Rem)
{
    20000fcf:	f3 0f 1e fa          	endbr64 
    20000fd3:	55                   	push   %rbp
    20000fd4:	48 89 e5             	mov    %rsp,%rbp
    20000fd7:	48 83 ec 10          	sub    $0x10,%rsp
    20000fdb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20000fdf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_REM, Cap_Captbl_Rem,
    20000fe3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20000fe7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20000feb:	48 b9 00 00 00 00 0e 	movabs $0xe00000000,%rcx
    20000ff2:	00 00 00 
    20000ff5:	48 09 ca             	or     %rcx,%rdx
    20000ff8:	48 89 d7             	mov    %rdx,%rdi
    20000ffb:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001000:	ba 00 00 00 00       	mov    $0x0,%edx
    20001005:	48 89 c6             	mov    %rax,%rsi
    20001008:	e8 e0 f0 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Rem,
                      0,
                      0);
}
    2000100d:	c9                   	leave  
    2000100e:	c3                   	ret    

000000002000100f <UVM_Kern_Act>:
                      kernel function ever causes a context switch, it is responsible
                      for setting the return value. On failure, a context switch 
                      in the kernel fucntion is banned.
******************************************************************************/
ret_t UVM_Kern_Act(cid_t Cap_Kern, ptr_t Func_ID, ptr_t Sub_ID, ptr_t Param1, ptr_t Param2)
{
    2000100f:	f3 0f 1e fa          	endbr64 
    20001013:	55                   	push   %rbp
    20001014:	48 89 e5             	mov    %rsp,%rbp
    20001017:	48 83 ec 30          	sub    $0x30,%rsp
    2000101b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000101f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001023:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001027:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    2000102b:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
    2000102f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001033:	48 c1 e0 20          	shl    $0x20,%rax
    20001037:	48 89 c2             	mov    %rax,%rdx
    2000103a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000103e:	89 c0                	mov    %eax,%eax
    20001040:	48 89 d6             	mov    %rdx,%rsi
    20001043:	48 09 c6             	or     %rax,%rsi
    20001046:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000104a:	48 ba 00 00 00 00 04 	movabs $0x400000000,%rdx
    20001051:	00 00 00 
    20001054:	48 09 d0             	or     %rdx,%rax
    20001057:	48 89 c7             	mov    %rax,%rdi
    2000105a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    2000105e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001062:	48 89 d1             	mov    %rdx,%rcx
    20001065:	48 89 c2             	mov    %rax,%rdx
    20001068:	e8 80 f0 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Sub_ID)|UVM_PARAM_D0(Func_ID),
                      Param1,
                      Param2);
}
    2000106d:	c9                   	leave  
    2000106e:	c3                   	ret    

000000002000106f <UVM_Pgtbl_Crt>:
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Pgtbl, 
                    ptr_t Vaddr, ptr_t Start_Addr, ptr_t Top_Flag,
                    ptr_t Size_Order, ptr_t Num_Order)
{
    2000106f:	f3 0f 1e fa          	endbr64 
    20001073:	55                   	push   %rbp
    20001074:	48 89 e5             	mov    %rsp,%rbp
    20001077:	48 83 ec 30          	sub    $0x30,%rsp
    2000107b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000107f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001083:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001087:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    2000108b:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    2000108f:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
    20001093:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20001097:	48 0b 45 d0          	or     -0x30(%rbp),%rax
    2000109b:	48 89 c2             	mov    %rax,%rdx
    2000109e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200010a2:	48 c1 e0 20          	shl    $0x20,%rax
    200010a6:	48 89 c1             	mov    %rax,%rcx
    200010a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200010ad:	48 c1 e0 10          	shl    $0x10,%rax
    200010b1:	89 c0                	mov    %eax,%eax
    200010b3:	48 09 c1             	or     %rax,%rcx
    200010b6:	48 8b 45 10          	mov    0x10(%rbp),%rax
    200010ba:	0f b7 c0             	movzwl %ax,%eax
    200010bd:	48 89 ce             	mov    %rcx,%rsi
    200010c0:	48 09 c6             	or     %rax,%rsi
    200010c3:	48 8b 45 18          	mov    0x18(%rbp),%rax
    200010c7:	48 c1 e0 10          	shl    $0x10,%rax
    200010cb:	48 c1 e0 20          	shl    $0x20,%rax
    200010cf:	48 89 c1             	mov    %rax,%rcx
    200010d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200010d6:	48 09 c1             	or     %rax,%rcx
    200010d9:	48 b8 00 00 00 00 0f 	movabs $0xf00000000,%rax
    200010e0:	00 00 00 
    200010e3:	48 89 cf             	mov    %rcx,%rdi
    200010e6:	48 09 c7             	or     %rax,%rdi
    200010e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200010ed:	48 89 d1             	mov    %rdx,%rcx
    200010f0:	48 89 c2             	mov    %rax,%rdx
    200010f3:	e8 f5 ef ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_Q1(Cap_Pgtbl)|UVM_PARAM_Q0(Size_Order),
                      Vaddr, 
                      Start_Addr|Top_Flag);
}
    200010f8:	c9                   	leave  
    200010f9:	c3                   	ret    

00000000200010fa <UVM_Pgtbl_Del>:
                                page table capability to be in. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Del(cid_t Cap_Captbl, cid_t Cap_Pgtbl)
{
    200010fa:	f3 0f 1e fa          	endbr64 
    200010fe:	55                   	push   %rbp
    200010ff:	48 89 e5             	mov    %rsp,%rbp
    20001102:	48 83 ec 10          	sub    $0x10,%rsp
    20001106:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000110a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DEL, Cap_Captbl,
    2000110e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001112:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001116:	48 b9 00 00 00 00 10 	movabs $0x1000000000,%rcx
    2000111d:	00 00 00 
    20001120:	48 09 ca             	or     %rcx,%rdx
    20001123:	48 89 d7             	mov    %rdx,%rdi
    20001126:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000112b:	ba 00 00 00 00       	mov    $0x0,%edx
    20001130:	48 89 c6             	mov    %rax,%rsi
    20001133:	e8 b5 ef ff ff       	call   200000ed <UVM_Svc>
                      Cap_Pgtbl,
                      0,
                      0);
}
    20001138:	c9                   	leave  
    20001139:	c3                   	ret    

000000002000113a <UVM_Pgtbl_Add>:
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Add(cid_t Cap_Pgtbl_Dst, ptr_t Pos_Dst, ptr_t Flags_Dst,
                    cid_t Cap_Pgtbl_Src, ptr_t Pos_Src, ptr_t Index)
{
    2000113a:	f3 0f 1e fa          	endbr64 
    2000113e:	55                   	push   %rbp
    2000113f:	48 89 e5             	mov    %rsp,%rbp
    20001142:	48 83 ec 30          	sub    $0x30,%rsp
    20001146:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000114a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2000114e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001152:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20001156:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    2000115a:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_ADD, 0,
    2000115e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001162:	48 c1 e0 20          	shl    $0x20,%rax
    20001166:	48 89 c2             	mov    %rax,%rdx
    20001169:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2000116d:	89 c0                	mov    %eax,%eax
    2000116f:	48 89 d1             	mov    %rdx,%rcx
    20001172:	48 09 c1             	or     %rax,%rcx
    20001175:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001179:	48 c1 e0 20          	shl    $0x20,%rax
    2000117d:	48 89 c2             	mov    %rax,%rdx
    20001180:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    20001184:	89 c0                	mov    %eax,%eax
    20001186:	48 09 c2             	or     %rax,%rdx
    20001189:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000118d:	48 c1 e0 20          	shl    $0x20,%rax
    20001191:	48 89 c6             	mov    %rax,%rsi
    20001194:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001198:	89 c0                	mov    %eax,%eax
    2000119a:	48 09 f0             	or     %rsi,%rax
    2000119d:	48 89 c6             	mov    %rax,%rsi
    200011a0:	48 b8 00 00 00 00 11 	movabs $0x1100000000,%rax
    200011a7:	00 00 00 
    200011aa:	48 89 c7             	mov    %rax,%rdi
    200011ad:	e8 3b ef ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Dst)|UVM_PARAM_D0(Pos_Dst),
                      UVM_PARAM_D1(Cap_Pgtbl_Src)|UVM_PARAM_D0(Pos_Src),
                      UVM_PARAM_D1(Flags_Dst)|UVM_PARAM_D0(Index));
}
    200011b2:	c9                   	leave  
    200011b3:	c3                   	ret    

00000000200011b4 <UVM_Pgtbl_Rem>:
              ptr_t Pos - The virtual address position to unmap from.
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Rem(cid_t Cap_Pgtbl, ptr_t Pos)
{
    200011b4:	f3 0f 1e fa          	endbr64 
    200011b8:	55                   	push   %rbp
    200011b9:	48 89 e5             	mov    %rsp,%rbp
    200011bc:	48 83 ec 10          	sub    $0x10,%rsp
    200011c0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200011c4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_REM, 0,
    200011c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200011cc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200011d0:	b9 00 00 00 00       	mov    $0x0,%ecx
    200011d5:	48 89 c6             	mov    %rax,%rsi
    200011d8:	48 b8 00 00 00 00 12 	movabs $0x1200000000,%rax
    200011df:	00 00 00 
    200011e2:	48 89 c7             	mov    %rax,%rdi
    200011e5:	e8 03 ef ff ff       	call   200000ed <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    200011ea:	c9                   	leave  
    200011eb:	c3                   	ret    

00000000200011ec <UVM_Pgtbl_Con>:
              ptr_t Flags_Child - This have no effect on MPU-based architectures.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Con(cid_t Cap_Pgtbl_Parent, ptr_t Pos, cid_t Cap_Pgtbl_Child, ptr_t Flags_Child)
{
    200011ec:	f3 0f 1e fa          	endbr64 
    200011f0:	55                   	push   %rbp
    200011f1:	48 89 e5             	mov    %rsp,%rbp
    200011f4:	48 83 ec 20          	sub    $0x20,%rsp
    200011f8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200011fc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001200:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001204:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
    20001208:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000120c:	48 c1 e0 20          	shl    $0x20,%rax
    20001210:	48 89 c2             	mov    %rax,%rdx
    20001213:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001217:	89 c0                	mov    %eax,%eax
    20001219:	48 89 d6             	mov    %rdx,%rsi
    2000121c:	48 09 c6             	or     %rax,%rsi
    2000121f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    20001223:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001227:	48 89 d1             	mov    %rdx,%rcx
    2000122a:	48 89 c2             	mov    %rax,%rdx
    2000122d:	48 b8 00 00 00 00 13 	movabs $0x1300000000,%rax
    20001234:	00 00 00 
    20001237:	48 89 c7             	mov    %rax,%rdi
    2000123a:	e8 ae ee ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Parent)|UVM_PARAM_D0(Cap_Pgtbl_Child),
                      Pos,
                      Flags_Child);
}
    2000123f:	c9                   	leave  
    20001240:	c3                   	ret    

0000000020001241 <UVM_Pgtbl_Des>:
                          table from.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Des(cid_t Cap_Pgtbl, ptr_t Pos)
{
    20001241:	f3 0f 1e fa          	endbr64 
    20001245:	55                   	push   %rbp
    20001246:	48 89 e5             	mov    %rsp,%rbp
    20001249:	48 83 ec 10          	sub    $0x10,%rsp
    2000124d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001251:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DES, 0,
    20001255:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001259:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000125d:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001262:	48 89 c6             	mov    %rax,%rsi
    20001265:	48 b8 00 00 00 00 14 	movabs $0x1400000000,%rax
    2000126c:	00 00 00 
    2000126f:	48 89 c7             	mov    %rax,%rdi
    20001272:	e8 76 ee ff ff       	call   200000ed <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    20001277:	c9                   	leave  
    20001278:	c3                   	ret    

0000000020001279 <UVM_Proc_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, cid_t Cap_Proc,
                   cid_t Cap_Captbl, cid_t Cap_Pgtbl, ptr_t Vaddr)
{
    20001279:	f3 0f 1e fa          	endbr64 
    2000127d:	55                   	push   %rbp
    2000127e:	48 89 e5             	mov    %rsp,%rbp
    20001281:	48 83 ec 30          	sub    $0x30,%rsp
    20001285:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001289:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2000128d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001291:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    20001295:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    20001299:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
    2000129d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200012a1:	48 c1 e0 20          	shl    $0x20,%rax
    200012a5:	48 89 c2             	mov    %rax,%rdx
    200012a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    200012ac:	89 c0                	mov    %eax,%eax
    200012ae:	48 09 c2             	or     %rax,%rdx
    200012b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200012b5:	48 c1 e0 20          	shl    $0x20,%rax
    200012b9:	48 89 c1             	mov    %rax,%rcx
    200012bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200012c0:	89 c0                	mov    %eax,%eax
    200012c2:	48 89 ce             	mov    %rcx,%rsi
    200012c5:	48 09 c6             	or     %rax,%rsi
    200012c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200012cc:	48 b9 00 00 00 00 15 	movabs $0x1500000000,%rcx
    200012d3:	00 00 00 
    200012d6:	48 09 c8             	or     %rcx,%rax
    200012d9:	48 89 c7             	mov    %rax,%rdi
    200012dc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    200012e0:	48 89 c1             	mov    %rax,%rcx
    200012e3:	e8 05 ee ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Proc),
                      UVM_PARAM_D1(Cap_Captbl)|UVM_PARAM_D0(Cap_Pgtbl),
                      Vaddr);
}
    200012e8:	c9                   	leave  
    200012e9:	c3                   	ret    

00000000200012ea <UVM_Proc_Del>:
              cid_t Cap_Proc - The capability to the process. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Del(cid_t Cap_Captbl, cid_t Cap_Proc)
{
    200012ea:	f3 0f 1e fa          	endbr64 
    200012ee:	55                   	push   %rbp
    200012ef:	48 89 e5             	mov    %rsp,%rbp
    200012f2:	48 83 ec 10          	sub    $0x10,%rsp
    200012f6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200012fa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_DEL, Cap_Captbl,
    200012fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001302:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001306:	48 b9 00 00 00 00 16 	movabs $0x1600000000,%rcx
    2000130d:	00 00 00 
    20001310:	48 09 ca             	or     %rcx,%rdx
    20001313:	48 89 d7             	mov    %rdx,%rdi
    20001316:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000131b:	ba 00 00 00 00       	mov    $0x0,%edx
    20001320:	48 89 c6             	mov    %rax,%rsi
    20001323:	e8 c5 ed ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      0,
                      0);
}
    20001328:	c9                   	leave  
    20001329:	c3                   	ret    

000000002000132a <UVM_Proc_Cpt>:
                                 this process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Cpt(cid_t Cap_Proc, cid_t Cap_Captbl)
{
    2000132a:	f3 0f 1e fa          	endbr64 
    2000132e:	55                   	push   %rbp
    2000132f:	48 89 e5             	mov    %rsp,%rbp
    20001332:	48 83 ec 10          	sub    $0x10,%rsp
    20001336:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000133a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CPT, 0,
    2000133e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001342:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001346:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000134b:	48 89 c6             	mov    %rax,%rsi
    2000134e:	48 b8 00 00 00 00 17 	movabs $0x1700000000,%rax
    20001355:	00 00 00 
    20001358:	48 89 c7             	mov    %rax,%rdi
    2000135b:	e8 8d ed ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Captbl,
                      0);
}
    20001360:	c9                   	leave  
    20001361:	c3                   	ret    

0000000020001362 <UVM_Proc_Pgt>:
                                process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Pgt(cid_t Cap_Proc, cid_t Cap_Pgtbl)
{
    20001362:	f3 0f 1e fa          	endbr64 
    20001366:	55                   	push   %rbp
    20001367:	48 89 e5             	mov    %rsp,%rbp
    2000136a:	48 83 ec 10          	sub    $0x10,%rsp
    2000136e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001372:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_PGT, 0,
    20001376:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000137a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000137e:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001383:	48 89 c6             	mov    %rax,%rsi
    20001386:	48 b8 00 00 00 00 18 	movabs $0x1800000000,%rax
    2000138d:	00 00 00 
    20001390:	48 89 c7             	mov    %rax,%rdi
    20001393:	e8 55 ed ff ff       	call   200000ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Pgtbl,
                      0);
}
    20001398:	c9                   	leave  
    20001399:	c3                   	ret    

000000002000139a <UVM_Thd_Crt>:
Output      : None.
Return      : ret_t - If successful, the Thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Thd,
                  cid_t Cap_Proc, ptr_t Max_Prio, ptr_t Vaddr)
{
    2000139a:	f3 0f 1e fa          	endbr64 
    2000139e:	55                   	push   %rbp
    2000139f:	48 89 e5             	mov    %rsp,%rbp
    200013a2:	48 83 ec 30          	sub    $0x30,%rsp
    200013a6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200013aa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200013ae:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200013b2:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    200013b6:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    200013ba:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
    200013be:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200013c2:	48 c1 e0 20          	shl    $0x20,%rax
    200013c6:	48 89 c2             	mov    %rax,%rdx
    200013c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    200013cd:	89 c0                	mov    %eax,%eax
    200013cf:	48 09 c2             	or     %rax,%rdx
    200013d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200013d6:	48 c1 e0 20          	shl    $0x20,%rax
    200013da:	48 89 c1             	mov    %rax,%rcx
    200013dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    200013e1:	89 c0                	mov    %eax,%eax
    200013e3:	48 89 ce             	mov    %rcx,%rsi
    200013e6:	48 09 c6             	or     %rax,%rsi
    200013e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200013ed:	48 b9 00 00 00 00 19 	movabs $0x1900000000,%rcx
    200013f4:	00 00 00 
    200013f7:	48 09 c8             	or     %rcx,%rax
    200013fa:	48 89 c7             	mov    %rax,%rdi
    200013fd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    20001401:	48 89 c1             	mov    %rax,%rcx
    20001404:	e8 e4 ec ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Thd),
                      UVM_PARAM_D1(Cap_Proc)|UVM_PARAM_D0(Max_Prio),
                      Vaddr);
}
    20001409:	c9                   	leave  
    2000140a:	c3                   	ret    

000000002000140b <UVM_Thd_Del>:
              cid_t Cap_Thd - The capability to the thread in the captbl. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Del(cid_t Cap_Captbl, cid_t Cap_Thd)
{
    2000140b:	f3 0f 1e fa          	endbr64 
    2000140f:	55                   	push   %rbp
    20001410:	48 89 e5             	mov    %rsp,%rbp
    20001413:	48 83 ec 10          	sub    $0x10,%rsp
    20001417:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000141b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_DEL, Cap_Captbl,
    2000141f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001423:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001427:	48 b9 00 00 00 00 1a 	movabs $0x1a00000000,%rcx
    2000142e:	00 00 00 
    20001431:	48 09 ca             	or     %rcx,%rdx
    20001434:	48 89 d7             	mov    %rdx,%rdi
    20001437:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000143c:	ba 00 00 00 00       	mov    $0x0,%edx
    20001441:	48 89 c6             	mov    %rax,%rsi
    20001444:	e8 a4 ec ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      0,
                      0);
}
    20001449:	c9                   	leave  
    2000144a:	c3                   	ret    

000000002000144b <UVM_Thd_Exec_Set>:
              ptr_t Param - The parameter of the thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Exec_Set(cid_t Cap_Thd, ptr_t Entry, ptr_t Stack, ptr_t Param)
{
    2000144b:	f3 0f 1e fa          	endbr64 
    2000144f:	55                   	push   %rbp
    20001450:	48 89 e5             	mov    %rsp,%rbp
    20001453:	48 83 ec 20          	sub    $0x20,%rsp
    20001457:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000145b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2000145f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001463:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, Cap_Thd,
    20001467:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000146b:	48 ba 00 00 00 00 06 	movabs $0x600000000,%rdx
    20001472:	00 00 00 
    20001475:	48 09 d0             	or     %rdx,%rax
    20001478:	48 89 c7             	mov    %rax,%rdi
    2000147b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    2000147f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20001483:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    20001487:	48 89 c6             	mov    %rax,%rsi
    2000148a:	e8 5e ec ff ff       	call   200000ed <UVM_Svc>
                      Entry, 
                      Stack,
                      Param);
}
    2000148f:	c9                   	leave  
    20001490:	c3                   	ret    

0000000020001491 <UVM_Thd_Hyp_Set>:
                            thread's register sets.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Hyp_Set(cid_t Cap_Thd, ptr_t Kaddr)
{
    20001491:	f3 0f 1e fa          	endbr64 
    20001495:	55                   	push   %rbp
    20001496:	48 89 e5             	mov    %rsp,%rbp
    20001499:	48 83 ec 10          	sub    $0x10,%rsp
    2000149d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200014a1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, 0,
    200014a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200014a9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200014ad:	b9 00 00 00 00       	mov    $0x0,%ecx
    200014b2:	48 89 c6             	mov    %rax,%rsi
    200014b5:	48 b8 00 00 00 00 06 	movabs $0x600000000,%rax
    200014bc:	00 00 00 
    200014bf:	48 89 c7             	mov    %rax,%rdi
    200014c2:	e8 26 ec ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      Kaddr,
                      0);
}
    200014c7:	c9                   	leave  
    200014c8:	c3                   	ret    

00000000200014c9 <UVM_Thd_Sched_Bind>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Bind(cid_t Cap_Thd, cid_t Cap_Thd_Sched, cid_t Cap_Sig, tid_t TID, ptr_t Prio)
{
    200014c9:	f3 0f 1e fa          	endbr64 
    200014cd:	55                   	push   %rbp
    200014ce:	48 89 e5             	mov    %rsp,%rbp
    200014d1:	48 83 ec 30          	sub    $0x30,%rsp
    200014d5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200014d9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200014dd:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200014e1:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    200014e5:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    200014e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200014ed:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200014f1:	48 89 d1             	mov    %rdx,%rcx
    200014f4:	48 c1 e1 20          	shl    $0x20,%rcx
    200014f8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    200014fc:	89 d2                	mov    %edx,%edx
    200014fe:	48 89 ce             	mov    %rcx,%rsi
    20001501:	48 09 d6             	or     %rdx,%rsi
    20001504:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001508:	48 b9 00 00 00 00 1b 	movabs $0x1b00000000,%rcx
    2000150f:	00 00 00 
    20001512:	48 89 d7             	mov    %rdx,%rdi
    20001515:	48 09 cf             	or     %rcx,%rdi
    20001518:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    2000151c:	48 89 d1             	mov    %rdx,%rcx
    2000151f:	48 89 c2             	mov    %rax,%rdx
    20001522:	e8 c6 eb ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Thd_Sched)|UVM_PARAM_D0(Cap_Sig),
                      TID, 
                      Prio);
}
    20001527:	c9                   	leave  
    20001528:	c3                   	ret    

0000000020001529 <UVM_Thd_Sched_Rcv>:
                              is simply not allowed. 2-Level.
Output      : None.
Return      : ret_t - If successful, the thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Rcv(cid_t Cap_Thd)
{
    20001529:	f3 0f 1e fa          	endbr64 
    2000152d:	55                   	push   %rbp
    2000152e:	48 89 e5             	mov    %rsp,%rbp
    20001531:	48 83 ec 10          	sub    $0x10,%rsp
    20001535:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_RCV, 0,
    20001539:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000153d:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001542:	ba 00 00 00 00       	mov    $0x0,%edx
    20001547:	48 89 c6             	mov    %rax,%rsi
    2000154a:	48 b8 00 00 00 00 1c 	movabs $0x1c00000000,%rax
    20001551:	00 00 00 
    20001554:	48 89 c7             	mov    %rax,%rdi
    20001557:	e8 91 eb ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    2000155c:	c9                   	leave  
    2000155d:	c3                   	ret    

000000002000155e <UVM_Thd_Sched_Prio>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Prio(cid_t Cap_Thd, ptr_t Prio)
{
    2000155e:	f3 0f 1e fa          	endbr64 
    20001562:	55                   	push   %rbp
    20001563:	48 89 e5             	mov    %rsp,%rbp
    20001566:	48 83 ec 10          	sub    $0x10,%rsp
    2000156a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000156e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_PRIO, 0,
    20001572:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001576:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000157a:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000157f:	48 89 c6             	mov    %rax,%rsi
    20001582:	48 b8 00 00 00 00 07 	movabs $0x700000000,%rax
    20001589:	00 00 00 
    2000158c:	48 89 c7             	mov    %rax,%rdi
    2000158f:	e8 59 eb ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      Prio, 
                      0);
}
    20001594:	c9                   	leave  
    20001595:	c3                   	ret    

0000000020001596 <UVM_Thd_Sched_Free>:
Input       : cid_t Cap_Thd - The capability to the thread. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Free(cid_t Cap_Thd)
{
    20001596:	f3 0f 1e fa          	endbr64 
    2000159a:	55                   	push   %rbp
    2000159b:	48 89 e5             	mov    %rsp,%rbp
    2000159e:	48 83 ec 10          	sub    $0x10,%rsp
    200015a2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_FREE, 0,
    200015a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200015aa:	b9 00 00 00 00       	mov    $0x0,%ecx
    200015af:	ba 00 00 00 00       	mov    $0x0,%edx
    200015b4:	48 89 c6             	mov    %rax,%rsi
    200015b7:	48 b8 00 00 00 00 05 	movabs $0x500000000,%rax
    200015be:	00 00 00 
    200015c1:	48 89 c7             	mov    %rax,%rdi
    200015c4:	e8 24 eb ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    200015c9:	c9                   	leave  
    200015ca:	c3                   	ret    

00000000200015cb <UVM_Thd_Time_Xfer>:
                           order of 100us or 1ms.
Output      : None.
Return      : ret_t - If successful, the destination time amount; or an error code.
******************************************************************************/
ret_t UVM_Thd_Time_Xfer(cid_t Cap_Thd_Dst, cid_t Cap_Thd_Src, ptr_t Time)
{
    200015cb:	f3 0f 1e fa          	endbr64 
    200015cf:	55                   	push   %rbp
    200015d0:	48 89 e5             	mov    %rsp,%rbp
    200015d3:	48 83 ec 20          	sub    $0x20,%rsp
    200015d7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200015db:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200015df:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_TIME_XFER, 0,
    200015e3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    200015e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200015eb:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    200015ef:	48 89 c6             	mov    %rax,%rsi
    200015f2:	48 b8 00 00 00 00 08 	movabs $0x800000000,%rax
    200015f9:	00 00 00 
    200015fc:	48 89 c7             	mov    %rax,%rdi
    200015ff:	e8 e9 ea ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd_Dst,
                      Cap_Thd_Src, 
                      Time);
}
    20001604:	c9                   	leave  
    20001605:	c3                   	ret    

0000000020001606 <UVM_Thd_Swt>:
                                 this thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Swt(cid_t Cap_Thd, ptr_t Full_Yield)
{
    20001606:	f3 0f 1e fa          	endbr64 
    2000160a:	55                   	push   %rbp
    2000160b:	48 89 e5             	mov    %rsp,%rbp
    2000160e:	48 83 ec 10          	sub    $0x10,%rsp
    20001612:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001616:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SWT, 0,
    2000161a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2000161e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001622:	b9 00 00 00 00       	mov    $0x0,%ecx
    20001627:	48 89 c6             	mov    %rax,%rsi
    2000162a:	48 b8 00 00 00 00 09 	movabs $0x900000000,%rax
    20001631:	00 00 00 
    20001634:	48 89 c7             	mov    %rax,%rdi
    20001637:	e8 b1 ea ff ff       	call   200000ed <UVM_Svc>
                      Cap_Thd,
                      Full_Yield, 
                      0);
}
    2000163c:	c9                   	leave  
    2000163d:	c3                   	ret    

000000002000163e <UVM_Sig_Crt>:
                            within the kernel virtual address.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Sig, ptr_t Vaddr)
{
    2000163e:	f3 0f 1e fa          	endbr64 
    20001642:	55                   	push   %rbp
    20001643:	48 89 e5             	mov    %rsp,%rbp
    20001646:	48 83 ec 20          	sub    $0x20,%rsp
    2000164a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    2000164e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001652:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001656:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
    2000165a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2000165e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    20001662:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    20001666:	48 be 00 00 00 00 1d 	movabs $0x1d00000000,%rsi
    2000166d:	00 00 00 
    20001670:	48 89 cf             	mov    %rcx,%rdi
    20001673:	48 09 f7             	or     %rsi,%rdi
    20001676:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    2000167a:	48 89 c6             	mov    %rax,%rsi
    2000167d:	e8 6b ea ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      Cap_Kmem,
                      Vaddr);
}
    20001682:	c9                   	leave  
    20001683:	c3                   	ret    

0000000020001684 <UVM_Sig_Del>:
              cid_t Cap_Sig - The capability to the signal. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Del(cid_t Cap_Captbl, cid_t Cap_Sig)
{
    20001684:	f3 0f 1e fa          	endbr64 
    20001688:	55                   	push   %rbp
    20001689:	48 89 e5             	mov    %rsp,%rbp
    2000168c:	48 83 ec 10          	sub    $0x10,%rsp
    20001690:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001694:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_DEL, Cap_Captbl,
    20001698:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000169c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200016a0:	48 b9 00 00 00 00 1e 	movabs $0x1e00000000,%rcx
    200016a7:	00 00 00 
    200016aa:	48 09 ca             	or     %rcx,%rdx
    200016ad:	48 89 d7             	mov    %rdx,%rdi
    200016b0:	b9 00 00 00 00       	mov    $0x0,%ecx
    200016b5:	ba 00 00 00 00       	mov    $0x0,%edx
    200016ba:	48 89 c6             	mov    %rax,%rsi
    200016bd:	e8 2b ea ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    200016c2:	c9                   	leave  
    200016c3:	c3                   	ret    

00000000200016c4 <UVM_Sig_Snd>:
Input       : cid_t Cap_Sig - The capability to the signal. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0, or an error code.
******************************************************************************/
ret_t UVM_Sig_Snd(cid_t Cap_Sig)
{
    200016c4:	f3 0f 1e fa          	endbr64 
    200016c8:	55                   	push   %rbp
    200016c9:	48 89 e5             	mov    %rsp,%rbp
    200016cc:	48 83 ec 10          	sub    $0x10,%rsp
    200016d0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_SND, 0,
    200016d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200016d8:	b9 00 00 00 00       	mov    $0x0,%ecx
    200016dd:	ba 00 00 00 00       	mov    $0x0,%edx
    200016e2:	48 89 c6             	mov    %rax,%rsi
    200016e5:	48 b8 00 00 00 00 02 	movabs $0x200000000,%rax
    200016ec:	00 00 00 
    200016ef:	48 89 c7             	mov    %rax,%rdi
    200016f2:	e8 f6 e9 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    200016f7:	c9                   	leave  
    200016f8:	c3                   	ret    

00000000200016f9 <UVM_Sig_Rcv>:
Output      : None.
Return      : ret_t - If successful, a non-negative number containing the number of signals
                      received will be returned; else an error code.
******************************************************************************/
ret_t UVM_Sig_Rcv(cid_t Cap_Sig, ptr_t Option)
{
    200016f9:	f3 0f 1e fa          	endbr64 
    200016fd:	55                   	push   %rbp
    200016fe:	48 89 e5             	mov    %rsp,%rbp
    20001701:	48 83 ec 10          	sub    $0x10,%rsp
    20001705:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001709:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_RCV, 0,
    2000170d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    20001711:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001715:	b9 00 00 00 00       	mov    $0x0,%ecx
    2000171a:	48 89 c6             	mov    %rax,%rsi
    2000171d:	48 b8 00 00 00 00 03 	movabs $0x300000000,%rax
    20001724:	00 00 00 
    20001727:	48 89 c7             	mov    %rax,%rdi
    2000172a:	e8 be e9 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Sig,
                      Option, 
                      0);
}
    2000172f:	c9                   	leave  
    20001730:	c3                   	ret    

0000000020001731 <UVM_Inv_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, 
                  cid_t Cap_Inv, cid_t Cap_Proc, ptr_t Vaddr)
{
    20001731:	f3 0f 1e fa          	endbr64 
    20001735:	55                   	push   %rbp
    20001736:	48 89 e5             	mov    %rsp,%rbp
    20001739:	48 83 ec 30          	sub    $0x30,%rsp
    2000173d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    20001741:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    20001745:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    20001749:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    2000174d:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    20001751:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    20001755:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    20001759:	48 89 d1             	mov    %rdx,%rcx
    2000175c:	48 c1 e1 20          	shl    $0x20,%rcx
    20001760:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20001764:	89 d2                	mov    %edx,%edx
    20001766:	48 89 ce             	mov    %rcx,%rsi
    20001769:	48 09 d6             	or     %rdx,%rsi
    2000176c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    20001770:	48 b9 00 00 00 00 1f 	movabs $0x1f00000000,%rcx
    20001777:	00 00 00 
    2000177a:	48 89 d7             	mov    %rdx,%rdi
    2000177d:	48 09 cf             	or     %rcx,%rdi
    20001780:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    20001784:	48 89 d1             	mov    %rdx,%rcx
    20001787:	48 89 c2             	mov    %rax,%rdx
    2000178a:	e8 5e e9 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Inv),
                      Cap_Proc, 
                      Vaddr);
}
    2000178f:	c9                   	leave  
    20001790:	c3                   	ret    

0000000020001791 <UVM_Inv_Del>:
              cid_t Cap_Inv - The capability to the invocation stub. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Del(cid_t Cap_Captbl, cid_t Cap_Inv)
{
    20001791:	f3 0f 1e fa          	endbr64 
    20001795:	55                   	push   %rbp
    20001796:	48 89 e5             	mov    %rsp,%rbp
    20001799:	48 83 ec 10          	sub    $0x10,%rsp
    2000179d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200017a1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_DEL, Cap_Captbl,
    200017a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    200017a9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    200017ad:	48 b9 00 00 00 00 20 	movabs $0x2000000000,%rcx
    200017b4:	00 00 00 
    200017b7:	48 09 ca             	or     %rcx,%rdx
    200017ba:	48 89 d7             	mov    %rdx,%rdi
    200017bd:	b9 00 00 00 00       	mov    $0x0,%ecx
    200017c2:	ba 00 00 00 00       	mov    $0x0,%edx
    200017c7:	48 89 c6             	mov    %rax,%rsi
    200017ca:	e8 1e e9 ff ff       	call   200000ed <UVM_Svc>
                      Cap_Inv,
                      0, 
                      0);
}
    200017cf:	c9                   	leave  
    200017d0:	c3                   	ret    

00000000200017d1 <UVM_Inv_Set>:
                                     immediately, or we wait for fault handling?
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Set(cid_t Cap_Inv, ptr_t Entry, ptr_t Stack, ptr_t Fault_Ret_Flag)
{
    200017d1:	f3 0f 1e fa          	endbr64 
    200017d5:	55                   	push   %rbp
    200017d6:	48 89 e5             	mov    %rsp,%rbp
    200017d9:	48 83 ec 20          	sub    $0x20,%rsp
    200017dd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    200017e1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    200017e5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    200017e9:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
    200017ed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    200017f1:	48 c1 e0 20          	shl    $0x20,%rax
    200017f5:	48 89 c2             	mov    %rax,%rdx
    200017f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200017fc:	89 c0                	mov    %eax,%eax
    200017fe:	48 89 d6             	mov    %rdx,%rsi
    20001801:	48 09 c6             	or     %rax,%rsi
    20001804:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    20001808:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2000180c:	48 89 d1             	mov    %rdx,%rcx
    2000180f:	48 89 c2             	mov    %rax,%rdx
    20001812:	48 b8 00 00 00 00 21 	movabs $0x2100000000,%rax
    20001819:	00 00 00 
    2000181c:	48 89 c7             	mov    %rax,%rdi
    2000181f:	e8 c9 e8 ff ff       	call   200000ed <UVM_Svc>
                      UVM_PARAM_D1(Fault_Ret_Flag)|UVM_PARAM_D0(Cap_Inv),
                      Entry, 
                      Stack);
}
    20001824:	c9                   	leave  
    20001825:	c3                   	ret    

0000000020001826 <UVM_Putchar>:
Input       : char Char - The character to print.
Output      : None.
Return      : ptr_t - Always 0.
******************************************************************************/
ptr_t UVM_Putchar(char Char)
{
    20001826:	f3 0f 1e fa          	endbr64 
    2000182a:	55                   	push   %rbp
    2000182b:	48 89 e5             	mov    %rsp,%rbp
    2000182e:	48 83 ec 10          	sub    $0x10,%rsp
    20001832:	89 f8                	mov    %edi,%eax
    20001834:	88 45 fc             	mov    %al,-0x4(%rbp)
    /* Wait until we have transmitted */
    while((__UVM_X64_In(UVM_X64_COM1+5)&0x20)==0);
    20001837:	90                   	nop
    20001838:	bf fd 03 00 00       	mov    $0x3fd,%edi
    2000183d:	e8 c3 e7 ff ff       	call   20000005 <__UVM_X64_In>
    20001842:	83 e0 20             	and    $0x20,%eax
    20001845:	48 85 c0             	test   %rax,%rax
    20001848:	74 ee                	je     20001838 <UVM_Putchar+0x12>

    __UVM_X64_Out(UVM_X64_COM1, Char);
    2000184a:	48 0f be 45 fc       	movsbq -0x4(%rbp),%rax
    2000184f:	48 89 c6             	mov    %rax,%rsi
    20001852:	bf f8 03 00 00       	mov    $0x3f8,%edi
    20001857:	e8 b3 e7 ff ff       	call   2000000f <__UVM_X64_Out>

    return 0;
    2000185c:	b8 00 00 00 00       	mov    $0x0,%eax
}
    20001861:	c9                   	leave  
    20001862:	c3                   	ret    

0000000020001863 <_UVM_Stack_Init>:
Output      : None.
Return      : ptr_t - The actual stack address to use for system call.
******************************************************************************/
ptr_t _UVM_Stack_Init(ptr_t Stack, ptr_t Size, ptr_t Stub, ptr_t Entry,
                      ptr_t Param1, ptr_t Param2, ptr_t Param3, ptr_t Param4)
{
    20001863:	f3 0f 1e fa          	endbr64 
    20001867:	55                   	push   %rbp
    20001868:	48 89 e5             	mov    %rsp,%rbp
    2000186b:	48 83 ec 40          	sub    $0x40,%rsp
    2000186f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    20001873:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    20001877:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    2000187b:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    2000187f:	4c 89 45 c8          	mov    %r8,-0x38(%rbp)
    20001883:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
	ptr_t* Stack_Ptr;

    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    20001887:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2000188b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    2000188f:	48 01 d0             	add    %rdx,%rax
    20001892:	48 2d 00 01 00 00    	sub    $0x100,%rax
    20001898:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    Stack_Ptr[0]=Param1;
    2000189c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200018a0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    200018a4:	48 89 10             	mov    %rdx,(%rax)
    Stack_Ptr[1]=Param2;
    200018a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200018ab:	48 8d 50 08          	lea    0x8(%rax),%rdx
    200018af:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    200018b3:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[2]=Param3;
    200018b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200018ba:	48 8d 50 10          	lea    0x10(%rax),%rdx
    200018be:	48 8b 45 10          	mov    0x10(%rbp),%rax
    200018c2:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[3]=Param4;
    200018c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200018c9:	48 8d 50 18          	lea    0x18(%rax),%rdx
    200018cd:	48 8b 45 18          	mov    0x18(%rbp),%rax
    200018d1:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[4]=Entry;
    200018d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    200018d8:	48 8d 50 20          	lea    0x20(%rax),%rdx
    200018dc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    200018e0:	48 89 02             	mov    %rax,(%rdx)

    return (ptr_t)Stack_Ptr;
    200018e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    200018e7:	c9                   	leave  
    200018e8:	c3                   	ret    

00000000200018e9 <_UVM_Idle>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void _UVM_Idle(void)
{
    200018e9:	f3 0f 1e fa          	endbr64 
    200018ed:	55                   	push   %rbp
    200018ee:	48 89 e5             	mov    %rsp,%rbp
    /* Do nothing. In the future we may call a kernel function to put us to sleep */
}
    200018f1:	90                   	nop
    200018f2:	5d                   	pop    %rbp
    200018f3:	c3                   	ret    

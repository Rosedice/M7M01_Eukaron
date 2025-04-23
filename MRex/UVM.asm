
./Object/UVM：     文件格式 elf64-x86-64


Disassembly of section .text:

0000000000000000 <_UVM_Entry>:
              space very well.
Input       : None.
Output      : None.
*****************************************************************************/
_UVM_Entry:
    JMP                 .
       0:	eb fe                	jmp    0 <_UVM_Entry>
    JMP                 main
       2:	e9 97 02 00 00       	jmp    29e <main>

0000000000000007 <__UVM_X64_In>:
Output         : None.
Return         : ptr_t - The data received from that port.
Register Usage : None.
*****************************************************************************/
__UVM_X64_In:
    PUSHQ               %RDX
       7:	52                   	push   %rdx
    MOVQ                %RDI,%RDX
       8:	48 89 fa             	mov    %rdi,%rdx
    MOVQ                %RAX,%RAX
       b:	48 89 c0             	mov    %rax,%rax
    INB                 (%DX),%AL
       e:	ec                   	in     (%dx),%al
    POPQ                %RDX
       f:	5a                   	pop    %rdx
    RETQ
      10:	c3                   	ret

0000000000000011 <__UVM_X64_Out>:
Output         : None.
Return         : None.
Register Usage : None.
*****************************************************************************/
__UVM_X64_Out:
    PUSHQ               %RDX
      11:	52                   	push   %rdx
    PUSHQ               %RAX
      12:	50                   	push   %rax
    MOVQ                %RDI,%RDX
      13:	48 89 fa             	mov    %rdi,%rdx
    MOVQ                %RSI,%RAX
      16:	48 89 f0             	mov    %rsi,%rax
    OUTB                %AL,(%DX)
      19:	ee                   	out    %al,(%dx)
    POPQ                %RAX
      1a:	58                   	pop    %rax
    POPQ                %RDX
      1b:	5a                   	pop    %rdx
    RETQ
      1c:	c3                   	ret

000000000000001d <__UVM_X64_Read_TSC>:
Output         : None.
Return         : ptr_t - The timestamp value returned.
Register Usage : None.
******************************************************************************/
__UVM_X64_Read_TSC:
    PUSHQ               %RDX
      1d:	52                   	push   %rdx
    RDTSC
      1e:	0f 31                	rdtsc
    SHL                 $32,%RDX
      20:	48 c1 e2 20          	shl    $0x20,%rdx
    ORQ                 %RDX,%RAX
      24:	48 09 d0             	or     %rdx,%rax
    POPQ                %RDX
      27:	5a                   	pop    %rdx
    RETQ
      28:	c3                   	ret

0000000000000029 <_UVM_Set_TLS_Pos>:
Output      : None.
Return      : None.
*****************************************************************************/
_UVM_Set_TLS_Pos:
    /* The alignment mask is not used in x86-64 */
    WRFSBASE            %RSI
      29:	f3 48 0f ae d6       	wrfsbase %rsi
    RETQ
      2e:	c3                   	ret

000000000000002f <_UVM_Get_TLS_Pos>:
Output      : None.
Return      : ptr_t* - The thread local storage position.
*****************************************************************************/
_UVM_Get_TLS_Pos:
    /* The alignment mask is not used in x86-64 */
    RDFSBASE            %RAX
      2f:	f3 48 0f ae c0       	rdfsbase %rax
    RETQ
      34:	c3                   	ret

0000000000000035 <_UVM_Thd_Stub>:
Input       : RDI - The entry address.
              RSI - The stack address that we are using now.
Output      : None.
*****************************************************************************/
_UVM_Thd_Stub:
    MOVQ                (%RSP),%RDI
      35:	48 8b 3c 24          	mov    (%rsp),%rdi
    MOVQ                8(%RSP),%RSI
      39:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    MOVQ                16(%RSP),%RDX
      3e:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    MOVQ                24(%RSP),%RCX
      43:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    JMP                 *32(%RSP)           /* Jump to the actual entry address */
      48:	ff 64 24 20          	jmp    *0x20(%rsp)

000000000000004c <_UVM_Inv_Stub>:
Input       : R4 - The entry address.
              R5 - The stack address that we are using now.
Output      : None.
*****************************************************************************/
_UVM_Inv_Stub:
    MOVQ                %RSI,%RDI           /* Pass the parameter */
      4c:	48 89 f7             	mov    %rsi,%rdi
    CALLQ               *32(%RSP)           /* Branch to the actual entry address */
      4f:	ff 54 24 20          	call   *0x20(%rsp)

    XORQ                %RDI,%RDI           /* UVM_SVC_INV_RET */
      53:	48 31 ff             	xor    %rdi,%rdi
    MOVQ                %RAX,%RSI           /* return value in RSI */
      56:	48 89 c6             	mov    %rax,%rsi
    SYSCALL                                 /* System call */
      59:	0f 05                	syscall

000000000000005b <UVM_Inv_Act>:
              RSI - ptr_t Param - The parameter for the call.
Output      : RDX - ptr_t* Retval - The return value from the call.
Return      : RAX - ptr_t - The return value of the system call itself.
*****************************************************************************/
UVM_Inv_Act:
    PUSHQ               %RBX                /* The user-level should push all context */
      5b:	53                   	push   %rbx
    PUSHQ               %RCX
      5c:	51                   	push   %rcx
    PUSHQ               %RDX
      5d:	52                   	push   %rdx
    PUSHQ               %RBP
      5e:	55                   	push   %rbp
    PUSHQ               %R8
      5f:	41 50                	push   %r8
    PUSHQ               %R9
      61:	41 51                	push   %r9
    PUSHQ               %R10
      63:	41 52                	push   %r10
    PUSHQ               %R11
      65:	41 53                	push   %r11
    PUSHQ               %R12
      67:	41 54                	push   %r12
    PUSHQ               %R13
      69:	41 55                	push   %r13
    PUSHQ               %R14
      6b:	41 56                	push   %r14
    PUSHQ               %R15
      6d:	41 57                	push   %r15
    PUSHFQ
      6f:	9c                   	pushf

    MOVQ                %RSI,%RDX           /* Param */
      70:	48 89 f2             	mov    %rsi,%rdx
    MOVQ                %RDI,%RSI           /* Cap_Inv */
      73:	48 89 fe             	mov    %rdi,%rsi
    MOVQ                $0x100000000,%RDI   /* UVM_SVC_INV_ACT */
      76:	48 bf 00 00 00 00 01 	movabs $0x100000000,%rdi
      7d:	00 00 00 
    SYSCALL
      80:	0f 05                	syscall

    POPFQ
      82:	9d                   	popf
    POPQ                %R15
      83:	41 5f                	pop    %r15
    POPQ                %R14
      85:	41 5e                	pop    %r14
    POPQ                %R13
      87:	41 5d                	pop    %r13
    POPQ                %R12
      89:	41 5c                	pop    %r12
    POPQ                %R11
      8b:	41 5b                	pop    %r11
    POPQ                %R10
      8d:	41 5a                	pop    %r10
    POPQ                %R9
      8f:	41 59                	pop    %r9
    POPQ                %R8
      91:	41 58                	pop    %r8
    POPQ                %RBP
      93:	5d                   	pop    %rbp
    POPQ                %RDX
      94:	5a                   	pop    %rdx
    POPQ                %RCX
      95:	59                   	pop    %rcx
    POPQ                %RBX                /* POP all saved registers now */
      96:	5b                   	pop    %rbx

    CMPQ                $0,%RDX             /* See if this return value is desired */
      97:	48 83 fa 00          	cmp    $0x0,%rdx
    JZ                  No_Retval
      9b:	74 03                	je     a0 <No_Retval>
    MOVQ                %RSI,(%RDX)
      9d:	48 89 32             	mov    %rsi,(%rdx)

00000000000000a0 <No_Retval>:
No_Retval:
    RETQ
      a0:	c3                   	ret

00000000000000a1 <UVM_Inv_Act_Dummy>:

UVM_Inv_Act_Dummy:
    .global UVM_Inv_Act_Dummy
    PUSHQ               %RBX                /* The user-level should push all context */
      a1:	53                   	push   %rbx
    PUSHQ               %RCX
      a2:	51                   	push   %rcx
    PUSHQ               %RDX
      a3:	52                   	push   %rdx
    PUSHQ               %RBP
      a4:	55                   	push   %rbp
    PUSHQ               %R8
      a5:	41 50                	push   %r8
    PUSHQ               %R9
      a7:	41 51                	push   %r9
    PUSHQ               %R10
      a9:	41 52                	push   %r10
    PUSHQ               %R11
      ab:	41 53                	push   %r11
    PUSHQ               %R12
      ad:	41 54                	push   %r12
    PUSHQ               %R13
      af:	41 55                	push   %r13
    PUSHQ               %R14
      b1:	41 56                	push   %r14
    PUSHQ               %R15
      b3:	41 57                	push   %r15
    PUSHFQ
      b5:	9c                   	pushf

    MOVQ                %RSI,%RDX           /* Param */
      b6:	48 89 f2             	mov    %rsi,%rdx
    MOVQ                %RDI,%RSI           /* Cap_Inv */
      b9:	48 89 fe             	mov    %rdi,%rsi
    MOVQ                $0x100000000,%RDI   /* UVM_SVC_INV_ACT */
      bc:	48 bf 00 00 00 00 01 	movabs $0x100000000,%rdi
      c3:	00 00 00 

    POPFQ
      c6:	9d                   	popf
    POPQ                %R15
      c7:	41 5f                	pop    %r15
    POPQ                %R14
      c9:	41 5e                	pop    %r14
    POPQ                %R13
      cb:	41 5d                	pop    %r13
    POPQ                %R12
      cd:	41 5c                	pop    %r12
    POPQ                %R11
      cf:	41 5b                	pop    %r11
    POPQ                %R10
      d1:	41 5a                	pop    %r10
    POPQ                %R9
      d3:	41 59                	pop    %r9
    POPQ                %R8
      d5:	41 58                	pop    %r8
    POPQ                %RBP
      d7:	5d                   	pop    %rbp
    POPQ                %RDX
      d8:	5a                   	pop    %rdx
    POPQ                %RCX
      d9:	59                   	pop    %rcx
    POPQ                %RBX                /* POP all saved registers now */
      da:	5b                   	pop    %rbx

    CMPQ                $0,%RDX             /* See if this return value is desired */
      db:	48 83 fa 00          	cmp    $0x0,%rdx
    JZ                  No_Retval_Dummy
      df:	74 03                	je     e4 <No_Retval_Dummy>
    MOVQ                %RSI,(%RDX)
      e1:	48 89 32             	mov    %rsi,(%rdx)

00000000000000e4 <No_Retval_Dummy>:
No_Retval_Dummy:
    RETQ
      e4:	c3                   	ret

00000000000000e5 <UVM_cret>:

UVM_cret:
    .global     UVM_cret
    RETQ
      e5:	c3                   	ret

00000000000000e6 <UVM_Inv_Ret>:
Input       : RDI - The returning result from the invocation.
Output      : None.
Return      : None.
*****************************************************************************/
UVM_Inv_Ret:
    MOVQ                %RDI,%RSI           /* Set return value to the register */
      e6:	48 89 fe             	mov    %rdi,%rsi
    XORQ                %RDI,%RDI           /* UVM_SVC_INV_RET */
      e9:	48 31 ff             	xor    %rdi,%rdi
    SYSCALL                                 /* System call */
      ec:	0f 05                	syscall
    RETQ
      ee:	c3                   	ret

00000000000000ef <UVM_Svc>:
              RCX - Argument 3. We need to move this to R8 because SYSCALL will use RCX.
Output      : None.
Retun       : RAX - The return value.
*****************************************************************************/
UVM_Svc:
    MOV                 %RCX,%R8
      ef:	49 89 c8             	mov    %rcx,%r8
    PUSH                %R11
      f2:	41 53                	push   %r11
    SYSCALL                                 /* Do the system call directly */
      f4:	0f 05                	syscall
    POP                 %R11
      f6:	41 5b                	pop    %r11
    RETQ
      f8:	c3                   	ret

00000000000000f9 <_UVM_MSB_Get>:
;Output         : None.
;Return         : ptr_t - The MSB position.   
;Register Usage : None. 
;*****************************************************************************/
_UVM_MSB_Get:
    LZCNTQ              %RDI,%RDI
      f9:	f3 48 0f bd ff       	lzcnt  %rdi,%rdi
    MOVQ                $63,%RAX
      fe:	48 c7 c0 3f 00 00 00 	mov    $0x3f,%rax
    SUBQ                %RDI,%RAX
     105:	48 29 f8             	sub    %rdi,%rax
    RETQ
     108:	c3                   	ret

0000000000000109 <UVM_Clear>:
              ptr_t Size - The size to clear.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_Clear(void* Addr, ptr_t Size)
{
     109:	55                   	push   %rbp
     10a:	48 89 e5             	mov    %rsp,%rbp
     10d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
     111:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    u8* Byte_Inc;
    ptr_t Words;
    ptr_t Bytes;
    
    /* On processors not that fast, copy by word is really important */
    Word_Inc=(ptr_t*)Addr;
     115:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     119:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     11d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     121:	48 c1 e8 03          	shr    $0x3,%rax
     125:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     129:	eb 15                	jmp    140 <UVM_Clear+0x37>
    {
        *Word_Inc=0;
     12b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     12f:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
        Word_Inc++;
     136:	48 83 45 f8 08       	addq   $0x8,-0x8(%rbp)
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
     13b:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
     140:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
     145:	75 e4                	jne    12b <UVM_Clear+0x22>
    }
    
    /* Get the final bytes */
    Byte_Inc=(u8*)Word_Inc;
     147:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     14b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    for(Bytes=Size%sizeof(ptr_t);Bytes>0;Bytes--)
     14f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     153:	83 e0 07             	and    $0x7,%eax
     156:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     15a:	eb 11                	jmp    16d <UVM_Clear+0x64>
    {
        *Byte_Inc=0;
     15c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     160:	c6 00 00             	movb   $0x0,(%rax)
        Byte_Inc++;
     163:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
    for(Bytes=Size%sizeof(ptr_t);Bytes>0;Bytes--)
     168:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
     16d:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
     172:	75 e8                	jne    15c <UVM_Clear+0x53>
    }
}
     174:	90                   	nop
     175:	90                   	nop
     176:	5d                   	pop    %rbp
     177:	c3                   	ret

0000000000000178 <test>:
ptr_t sum;
ptr_t sumin;
ptr_t sumout;

void test(void)
{
     178:	55                   	push   %rbp
     179:	48 89 e5             	mov    %rsp,%rbp
     17c:	48 83 ec 10          	sub    $0x10,%rsp
    cnt_t Count;
    sum=0;
     180:	48 c7 05 95 1e 00 00 	movq   $0x0,0x1e95(%rip)        # 2020 <sum>
     187:	00 00 00 00 

    for(Count=0;Count<1000000;Count++)
     18b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     192:	00 
     193:	eb 4e                	jmp    1e3 <test+0x6b>
    {
        start=__UVM_X64_Read_TSC();
     195:	e8 83 fe ff ff       	call   1d <__UVM_X64_Read_TSC>
     19a:	48 89 05 67 1e 00 00 	mov    %rax,0x1e67(%rip)        # 2008 <start>
        UVM_Thd_Swt(TEST_THD2,0);
     1a1:	be 00 00 00 00       	mov    $0x0,%esi
     1a6:	bf 0a 00 00 00       	mov    $0xa,%edi
     1ab:	e8 df 17 00 00       	call   198f <UVM_Thd_Swt>
        end=__UVM_X64_Read_TSC();
     1b0:	e8 68 fe ff ff       	call   1d <__UVM_X64_Read_TSC>
     1b5:	48 89 05 5c 1e 00 00 	mov    %rax,0x1e5c(%rip)        # 2018 <end>
        sum+=end-start;
     1bc:	48 8b 15 55 1e 00 00 	mov    0x1e55(%rip),%rdx        # 2018 <end>
     1c3:	48 8b 05 3e 1e 00 00 	mov    0x1e3e(%rip),%rax        # 2008 <start>
     1ca:	48 29 c2             	sub    %rax,%rdx
     1cd:	48 8b 05 4c 1e 00 00 	mov    0x1e4c(%rip),%rax        # 2020 <sum>
     1d4:	48 01 d0             	add    %rdx,%rax
     1d7:	48 89 05 42 1e 00 00 	mov    %rax,0x1e42(%rip)        # 2020 <sum>
    for(Count=0;Count<1000000;Count++)
     1de:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     1e3:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
     1ea:	00 
     1eb:	7e a8                	jle    195 <test+0x1d>
    }

    UVM_LOG_S("\r\nswtch ");
     1ed:	bf 48 1c 00 00       	mov    $0x1c48,%edi
     1f2:	e8 dc 0e 00 00       	call   10d3 <UVM_Print_String>
    UVM_LOG_I(sum/1000000);
     1f7:	48 8b 05 22 1e 00 00 	mov    0x1e22(%rip),%rax        # 2020 <sum>
     1fe:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     205:	de 1b 43 
     208:	48 f7 e2             	mul    %rdx
     20b:	48 89 d0             	mov    %rdx,%rax
     20e:	48 c1 e8 12          	shr    $0x12,%rax
     212:	48 89 c7             	mov    %rax,%rdi
     215:	e8 f7 0b 00 00       	call   e11 <UVM_Print_Int>
    UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*8, sum/1000000, 0);
     21a:	48 8b 05 ff 1d 00 00 	mov    0x1dff(%rip),%rax        # 2020 <sum>
     221:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     228:	de 1b 43 
     22b:	48 f7 e2             	mul    %rdx
     22e:	48 89 d0             	mov    %rdx,%rax
     231:	48 c1 e8 12          	shr    $0x12,%rax
     235:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     23b:	48 89 c1             	mov    %rax,%rcx
     23e:	ba 00 05 00 00       	mov    $0x500,%edx
     243:	be 07 00 00 00       	mov    $0x7,%esi
     248:	bf 04 00 00 00       	mov    $0x4,%edi
     24d:	e8 b8 11 00 00       	call   140a <UVM_Kern_Act>
    while(1);
     252:	90                   	nop
     253:	eb fd                	jmp    252 <test+0xda>

0000000000000255 <test2>:
}

void test2(void)
{
     255:	55                   	push   %rbp
     256:	48 89 e5             	mov    %rsp,%rbp
    while(1)
    {
        UVM_Thd_Swt(TEST_THD1,0);
     259:	be 00 00 00 00       	mov    $0x0,%esi
     25e:	bf 09 00 00 00       	mov    $0x9,%edi
     263:	e8 27 17 00 00       	call   198f <UVM_Thd_Swt>
     268:	eb ef                	jmp    259 <test2+0x4>

000000000000026a <sinvtest>:
    }
}

void sinvtest(ptr_t Param)
{
     26a:	55                   	push   %rbp
     26b:	48 89 e5             	mov    %rsp,%rbp
     26e:	48 83 ec 10          	sub    $0x10,%rsp
     272:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    middle=__UVM_X64_Read_TSC();
     276:	e8 a2 fd ff ff       	call   1d <__UVM_X64_Read_TSC>
     27b:	48 89 05 8e 1d 00 00 	mov    %rax,0x1d8e(%rip)        # 2010 <middle>
    UVM_Svc(0,0,0,0);
     282:	b9 00 00 00 00       	mov    $0x0,%ecx
     287:	ba 00 00 00 00       	mov    $0x0,%edx
     28c:	be 00 00 00 00       	mov    $0x0,%esi
     291:	bf 00 00 00 00       	mov    $0x0,%edi
     296:	e8 54 fe ff ff       	call   ef <UVM_Svc>
}
     29b:	90                   	nop
     29c:	c9                   	leave
     29d:	c3                   	ret

000000000000029e <main>:
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(ptr_t CPUID)
{
     29e:	55                   	push   %rbp
     29f:	48 89 e5             	mov    %rsp,%rbp
     2a2:	48 83 ec 20          	sub    $0x20,%rsp
     2a6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    ptr_t Cur_Addr;
    cnt_t Count;
    
    UVM_LOG_I(CPUID);
     2aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     2ae:	48 89 c7             	mov    %rax,%rdi
     2b1:	e8 5b 0b 00 00       	call   e11 <UVM_Print_Int>
    /* We only print information on the first CPU */
    if(CPUID==0)
     2b6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
     2bb:	0f 85 c4 0a 00 00    	jne    d85 <main+0xae7>
    {
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0, 1234, 0);
     2c1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     2c7:	b9 d2 04 00 00       	mov    $0x4d2,%ecx
     2cc:	ba 00 00 00 00       	mov    $0x0,%edx
     2d1:	be 07 00 00 00       	mov    $0x7,%esi
     2d6:	bf 04 00 00 00       	mov    $0x4,%edi
     2db:	e8 2a 11 00 00       	call   140a <UVM_Kern_Act>
        UVM_LOG_S("\r\n");
        UVM_LOG_S("                  Application Processor User-level Platform!\r\n");
        UVM_LOG_S("-------------------------------------------------------------------------------\r\n");
    UVM_LOG_U(__UVM_X64_Read_TSC());
    UVM_LOG_U(__UVM_X64_Read_TSC());*/
        sum=0;
     2e0:	48 c7 05 35 1d 00 00 	movq   $0x0,0x1d35(%rip)        # 2020 <sum>
     2e7:	00 00 00 00 

        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
     2eb:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     2f2:	00 
     2f3:	eb 3f                	jmp    334 <main+0x96>
        {
            start=__UVM_X64_Read_TSC();
     2f5:	e8 23 fd ff ff       	call   1d <__UVM_X64_Read_TSC>
     2fa:	48 89 05 07 1d 00 00 	mov    %rax,0x1d07(%rip)        # 2008 <start>
            end=__UVM_X64_Read_TSC();
     301:	e8 17 fd ff ff       	call   1d <__UVM_X64_Read_TSC>
     306:	48 89 05 0b 1d 00 00 	mov    %rax,0x1d0b(%rip)        # 2018 <end>
            sum+=end-start;
     30d:	48 8b 15 04 1d 00 00 	mov    0x1d04(%rip),%rdx        # 2018 <end>
     314:	48 8b 05 ed 1c 00 00 	mov    0x1ced(%rip),%rax        # 2008 <start>
     31b:	48 29 c2             	sub    %rax,%rdx
     31e:	48 8b 05 fb 1c 00 00 	mov    0x1cfb(%rip),%rax        # 2020 <sum>
     325:	48 01 d0             	add    %rdx,%rax
     328:	48 89 05 f1 1c 00 00 	mov    %rax,0x1cf1(%rip)        # 2020 <sum>
        for(Count=0;Count<1000000;Count++)
     32f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     334:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
     33b:	00 
     33c:	7e b7                	jle    2f5 <main+0x57>
        }
        UVM_LOG_S("\r\nempty");
     33e:	bf 51 1c 00 00       	mov    $0x1c51,%edi
     343:	e8 8b 0d 00 00       	call   10d3 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
     348:	48 8b 05 d1 1c 00 00 	mov    0x1cd1(%rip),%rax        # 2020 <sum>
     34f:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     356:	de 1b 43 
     359:	48 f7 e2             	mul    %rdx
     35c:	48 89 d0             	mov    %rdx,%rax
     35f:	48 c1 e8 12          	shr    $0x12,%rax
     363:	48 89 c7             	mov    %rax,%rdi
     366:	e8 a6 0a 00 00       	call   e11 <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0, sum/1000000, 0);
     36b:	48 8b 05 ae 1c 00 00 	mov    0x1cae(%rip),%rax        # 2020 <sum>
     372:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     379:	de 1b 43 
     37c:	48 f7 e2             	mul    %rdx
     37f:	48 89 d0             	mov    %rdx,%rax
     382:	48 c1 e8 12          	shr    $0x12,%rax
     386:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     38c:	48 89 c1             	mov    %rax,%rcx
     38f:	ba a0 00 00 00       	mov    $0xa0,%edx
     394:	be 07 00 00 00       	mov    $0x7,%esi
     399:	bf 04 00 00 00       	mov    $0x4,%edi
     39e:	e8 67 10 00 00       	call   140a <UVM_Kern_Act>

        sum=0;
     3a3:	48 c7 05 72 1c 00 00 	movq   $0x0,0x1c72(%rip)        # 2020 <sum>
     3aa:	00 00 00 00 

        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
     3ae:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     3b5:	00 
     3b6:	eb 60                	jmp    418 <main+0x17a>
        {
            start=__UVM_X64_Read_TSC();
     3b8:	e8 60 fc ff ff       	call   1d <__UVM_X64_Read_TSC>
     3bd:	48 89 05 44 1c 00 00 	mov    %rax,0x1c44(%rip)        # 2008 <start>
            UVM_Svc(-1,-1,-1,-1);
     3c4:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
     3cb:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
     3d2:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
     3d9:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
     3e0:	e8 0a fd ff ff       	call   ef <UVM_Svc>
            end=__UVM_X64_Read_TSC();
     3e5:	e8 33 fc ff ff       	call   1d <__UVM_X64_Read_TSC>
     3ea:	48 89 05 27 1c 00 00 	mov    %rax,0x1c27(%rip)        # 2018 <end>
            sum+=end-start;
     3f1:	48 8b 15 20 1c 00 00 	mov    0x1c20(%rip),%rdx        # 2018 <end>
     3f8:	48 8b 05 09 1c 00 00 	mov    0x1c09(%rip),%rax        # 2008 <start>
     3ff:	48 29 c2             	sub    %rax,%rdx
     402:	48 8b 05 17 1c 00 00 	mov    0x1c17(%rip),%rax        # 2020 <sum>
     409:	48 01 d0             	add    %rdx,%rax
     40c:	48 89 05 0d 1c 00 00 	mov    %rax,0x1c0d(%rip)        # 2020 <sum>
        for(Count=0;Count<1000000;Count++)
     413:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     418:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
     41f:	00 
     420:	7e 96                	jle    3b8 <main+0x11a>
        }
        UVM_LOG_S("\r\nraw");
     422:	bf 59 1c 00 00       	mov    $0x1c59,%edi
     427:	e8 a7 0c 00 00       	call   10d3 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
     42c:	48 8b 05 ed 1b 00 00 	mov    0x1bed(%rip),%rax        # 2020 <sum>
     433:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     43a:	de 1b 43 
     43d:	48 f7 e2             	mul    %rdx
     440:	48 89 d0             	mov    %rdx,%rax
     443:	48 c1 e8 12          	shr    $0x12,%rax
     447:	48 89 c7             	mov    %rax,%rdi
     44a:	e8 c2 09 00 00       	call   e11 <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*2, sum/1000000, 0);
     44f:	48 8b 05 ca 1b 00 00 	mov    0x1bca(%rip),%rax        # 2020 <sum>
     456:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     45d:	de 1b 43 
     460:	48 f7 e2             	mul    %rdx
     463:	48 89 d0             	mov    %rdx,%rax
     466:	48 c1 e8 12          	shr    $0x12,%rax
     46a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     470:	48 89 c1             	mov    %rax,%rcx
     473:	ba 40 01 00 00       	mov    $0x140,%edx
     478:	be 07 00 00 00       	mov    $0x7,%esi
     47d:	bf 04 00 00 00       	mov    $0x4,%edi
     482:	e8 83 0f 00 00       	call   140a <UVM_Kern_Act>

        Cur_Addr=0xFFFF800010000000ULL; //0xFFFF800007000000ULL on phani
     487:	48 b8 00 00 00 10 00 	movabs $0xffff800010000000,%rax
     48e:	80 ff ff 
     491:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, UVM_BOOT_INIT_PROC, Cur_Addr)>=0);
     495:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     499:	49 89 c0             	mov    %rax,%r8
     49c:	b9 02 00 00 00       	mov    $0x2,%ecx
     4a1:	ba 0b 00 00 00       	mov    $0xb,%edx
     4a6:	be 00 80 05 00       	mov    $0x58000,%esi
     4ab:	bf 00 00 00 00       	mov    $0x0,%edi
     4b0:	e8 f1 15 00 00       	call   1aa6 <UVM_Inv_Crt>
     4b5:	48 85 c0             	test   %rax,%rax
     4b8:	79 5d                	jns    517 <main+0x279>
     4ba:	bf 60 1c 00 00       	mov    $0x1c60,%edi
     4bf:	e8 0f 0c 00 00       	call   10d3 <UVM_Print_String>
     4c4:	bf 91 1c 00 00       	mov    $0x1c91,%edi
     4c9:	e8 05 0c 00 00       	call   10d3 <UVM_Print_String>
     4ce:	bf 9d 1c 00 00       	mov    $0x1c9d,%edi
     4d3:	e8 fb 0b 00 00       	call   10d3 <UVM_Print_String>
     4d8:	bf b3 00 00 00       	mov    $0xb3,%edi
     4dd:	e8 2f 09 00 00       	call   e11 <UVM_Print_Int>
     4e2:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     4e7:	e8 e7 0b 00 00       	call   10d3 <UVM_Print_String>
     4ec:	bf a8 1c 00 00       	mov    $0x1ca8,%edi
     4f1:	e8 dd 0b 00 00       	call   10d3 <UVM_Print_String>
     4f6:	bf b4 1c 00 00       	mov    $0x1cb4,%edi
     4fb:	e8 d3 0b 00 00       	call   10d3 <UVM_Print_String>
     500:	bf b7 1c 00 00       	mov    $0x1cb7,%edi
     505:	e8 c9 0b 00 00       	call   10d3 <UVM_Print_String>
     50a:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     50f:	e8 bf 0b 00 00       	call   10d3 <UVM_Print_String>
     514:	90                   	nop
     515:	eb fd                	jmp    514 <main+0x276>
        Cur_Addr+=UVM_INV_SIZE;
     517:	48 83 45 f0 50       	addq   $0x50,-0x10(%rbp)
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1, sinvtest,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     51c:	b8 6a 02 00 00       	mov    $0x26a,%eax
     521:	b9 00 00 00 00       	mov    $0x0,%ecx
     526:	ba 00 00 c0 00       	mov    $0xc00000,%edx
     52b:	48 89 c6             	mov    %rax,%rsi
     52e:	bf 0b 00 00 00       	mov    $0xb,%edi
     533:	e8 03 16 00 00       	call   1b3b <UVM_Inv_Set>
     538:	48 85 c0             	test   %rax,%rax
     53b:	79 5d                	jns    59a <main+0x2fc>
     53d:	bf 60 1c 00 00       	mov    $0x1c60,%edi
     542:	e8 8c 0b 00 00       	call   10d3 <UVM_Print_String>
     547:	bf 91 1c 00 00       	mov    $0x1c91,%edi
     54c:	e8 82 0b 00 00       	call   10d3 <UVM_Print_String>
     551:	bf 9d 1c 00 00       	mov    $0x1c9d,%edi
     556:	e8 78 0b 00 00       	call   10d3 <UVM_Print_String>
     55b:	bf b5 00 00 00       	mov    $0xb5,%edi
     560:	e8 ac 08 00 00       	call   e11 <UVM_Print_Int>
     565:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     56a:	e8 64 0b 00 00       	call   10d3 <UVM_Print_String>
     56f:	bf a8 1c 00 00       	mov    $0x1ca8,%edi
     574:	e8 5a 0b 00 00       	call   10d3 <UVM_Print_String>
     579:	bf b4 1c 00 00       	mov    $0x1cb4,%edi
     57e:	e8 50 0b 00 00       	call   10d3 <UVM_Print_String>
     583:	bf b7 1c 00 00       	mov    $0x1cb7,%edi
     588:	e8 46 0b 00 00       	call   10d3 <UVM_Print_String>
     58d:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     592:	e8 3c 0b 00 00       	call   10d3 <UVM_Print_String>
     597:	90                   	nop
     598:	eb fd                	jmp    597 <main+0x2f9>

        sum=0;
     59a:	48 c7 05 7b 1a 00 00 	movq   $0x0,0x1a7b(%rip)        # 2020 <sum>
     5a1:	00 00 00 00 
        sumin=0;
     5a5:	48 c7 05 78 1a 00 00 	movq   $0x0,0x1a78(%rip)        # 2028 <sumin>
     5ac:	00 00 00 00 
        sumout=0;
     5b0:	48 c7 05 75 1a 00 00 	movq   $0x0,0x1a75(%rip)        # 2030 <sumout>
     5b7:	00 00 00 00 
        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
     5bb:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     5c2:	00 
     5c3:	e9 97 00 00 00       	jmp    65f <main+0x3c1>
        {
            start=__UVM_X64_Read_TSC();
     5c8:	e8 50 fa ff ff       	call   1d <__UVM_X64_Read_TSC>
     5cd:	48 89 05 34 1a 00 00 	mov    %rax,0x1a34(%rip)        # 2008 <start>
            UVM_Inv_Act(TEST_INV1,0,0);
     5d4:	ba 00 00 00 00       	mov    $0x0,%edx
     5d9:	be 00 00 00 00       	mov    $0x0,%esi
     5de:	bf 0b 00 00 00       	mov    $0xb,%edi
     5e3:	e8 73 fa ff ff       	call   5b <UVM_Inv_Act>
            end=__UVM_X64_Read_TSC();
     5e8:	e8 30 fa ff ff       	call   1d <__UVM_X64_Read_TSC>
     5ed:	48 89 05 24 1a 00 00 	mov    %rax,0x1a24(%rip)        # 2018 <end>
            sum+=end-start;
     5f4:	48 8b 15 1d 1a 00 00 	mov    0x1a1d(%rip),%rdx        # 2018 <end>
     5fb:	48 8b 05 06 1a 00 00 	mov    0x1a06(%rip),%rax        # 2008 <start>
     602:	48 29 c2             	sub    %rax,%rdx
     605:	48 8b 05 14 1a 00 00 	mov    0x1a14(%rip),%rax        # 2020 <sum>
     60c:	48 01 d0             	add    %rdx,%rax
     60f:	48 89 05 0a 1a 00 00 	mov    %rax,0x1a0a(%rip)        # 2020 <sum>
            sumin+=middle-start;
     616:	48 8b 15 f3 19 00 00 	mov    0x19f3(%rip),%rdx        # 2010 <middle>
     61d:	48 8b 05 e4 19 00 00 	mov    0x19e4(%rip),%rax        # 2008 <start>
     624:	48 29 c2             	sub    %rax,%rdx
     627:	48 8b 05 fa 19 00 00 	mov    0x19fa(%rip),%rax        # 2028 <sumin>
     62e:	48 01 d0             	add    %rdx,%rax
     631:	48 89 05 f0 19 00 00 	mov    %rax,0x19f0(%rip)        # 2028 <sumin>
            sumout+=end-middle;
     638:	48 8b 15 d9 19 00 00 	mov    0x19d9(%rip),%rdx        # 2018 <end>
     63f:	48 8b 05 ca 19 00 00 	mov    0x19ca(%rip),%rax        # 2010 <middle>
     646:	48 29 c2             	sub    %rax,%rdx
     649:	48 8b 05 e0 19 00 00 	mov    0x19e0(%rip),%rax        # 2030 <sumout>
     650:	48 01 d0             	add    %rdx,%rax
     653:	48 89 05 d6 19 00 00 	mov    %rax,0x19d6(%rip)        # 2030 <sumout>
        for(Count=0;Count<1000000;Count++)
     65a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     65f:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
     666:	00 
     667:	0f 8e 5b ff ff ff    	jle    5c8 <main+0x32a>
        }
        UVM_LOG_S("\r\ninv");
     66d:	bf c0 1c 00 00       	mov    $0x1cc0,%edi
     672:	e8 5c 0a 00 00       	call   10d3 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
     677:	48 8b 05 a2 19 00 00 	mov    0x19a2(%rip),%rax        # 2020 <sum>
     67e:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     685:	de 1b 43 
     688:	48 f7 e2             	mul    %rdx
     68b:	48 89 d0             	mov    %rdx,%rax
     68e:	48 c1 e8 12          	shr    $0x12,%rax
     692:	48 89 c7             	mov    %rax,%rdi
     695:	e8 77 07 00 00       	call   e11 <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*3, sum/1000000, 0);
     69a:	48 8b 05 7f 19 00 00 	mov    0x197f(%rip),%rax        # 2020 <sum>
     6a1:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     6a8:	de 1b 43 
     6ab:	48 f7 e2             	mul    %rdx
     6ae:	48 89 d0             	mov    %rdx,%rax
     6b1:	48 c1 e8 12          	shr    $0x12,%rax
     6b5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     6bb:	48 89 c1             	mov    %rax,%rcx
     6be:	ba e0 01 00 00       	mov    $0x1e0,%edx
     6c3:	be 07 00 00 00       	mov    $0x7,%esi
     6c8:	bf 04 00 00 00       	mov    $0x4,%edi
     6cd:	e8 38 0d 00 00       	call   140a <UVM_Kern_Act>
        UVM_LOG_S("\r\nin");
     6d2:	bf c6 1c 00 00       	mov    $0x1cc6,%edi
     6d7:	e8 f7 09 00 00       	call   10d3 <UVM_Print_String>
        UVM_LOG_I(sumin/1000000);
     6dc:	48 8b 05 45 19 00 00 	mov    0x1945(%rip),%rax        # 2028 <sumin>
     6e3:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     6ea:	de 1b 43 
     6ed:	48 f7 e2             	mul    %rdx
     6f0:	48 89 d0             	mov    %rdx,%rax
     6f3:	48 c1 e8 12          	shr    $0x12,%rax
     6f7:	48 89 c7             	mov    %rax,%rdi
     6fa:	e8 12 07 00 00       	call   e11 <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*4, sumin/1000000, 0);
     6ff:	48 8b 05 22 19 00 00 	mov    0x1922(%rip),%rax        # 2028 <sumin>
     706:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     70d:	de 1b 43 
     710:	48 f7 e2             	mul    %rdx
     713:	48 89 d0             	mov    %rdx,%rax
     716:	48 c1 e8 12          	shr    $0x12,%rax
     71a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     720:	48 89 c1             	mov    %rax,%rcx
     723:	ba 80 02 00 00       	mov    $0x280,%edx
     728:	be 07 00 00 00       	mov    $0x7,%esi
     72d:	bf 04 00 00 00       	mov    $0x4,%edi
     732:	e8 d3 0c 00 00       	call   140a <UVM_Kern_Act>
        UVM_LOG_S("\r\nout");
     737:	bf cb 1c 00 00       	mov    $0x1ccb,%edi
     73c:	e8 92 09 00 00       	call   10d3 <UVM_Print_String>
        UVM_LOG_I(sumout/1000000);
     741:	48 8b 05 e8 18 00 00 	mov    0x18e8(%rip),%rax        # 2030 <sumout>
     748:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     74f:	de 1b 43 
     752:	48 f7 e2             	mul    %rdx
     755:	48 89 d0             	mov    %rdx,%rax
     758:	48 c1 e8 12          	shr    $0x12,%rax
     75c:	48 89 c7             	mov    %rax,%rdi
     75f:	e8 ad 06 00 00       	call   e11 <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*5, sumout/1000000, 0);
     764:	48 8b 05 c5 18 00 00 	mov    0x18c5(%rip),%rax        # 2030 <sumout>
     76b:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     772:	de 1b 43 
     775:	48 f7 e2             	mul    %rdx
     778:	48 89 d0             	mov    %rdx,%rax
     77b:	48 c1 e8 12          	shr    $0x12,%rax
     77f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     785:	48 89 c1             	mov    %rax,%rcx
     788:	ba 20 03 00 00       	mov    $0x320,%edx
     78d:	be 07 00 00 00       	mov    $0x7,%esi
     792:	bf 04 00 00 00       	mov    $0x4,%edi
     797:	e8 6e 0c 00 00       	call   140a <UVM_Kern_Act>

        /* Stub test */
        sum=0;
     79c:	48 c7 05 79 18 00 00 	movq   $0x0,0x1879(%rip)        # 2020 <sum>
     7a3:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
     7a7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     7ae:	00 
     7af:	eb 58                	jmp    809 <main+0x56b>
        {
            start=__UVM_X64_Read_TSC();
     7b1:	e8 67 f8 ff ff       	call   1d <__UVM_X64_Read_TSC>
     7b6:	48 89 05 4b 18 00 00 	mov    %rax,0x184b(%rip)        # 2008 <start>
            UVM_Inv_Act_Dummy(TEST_INV1,0,0);
     7bd:	ba 00 00 00 00       	mov    $0x0,%edx
     7c2:	be 00 00 00 00       	mov    $0x0,%esi
     7c7:	bf 0b 00 00 00       	mov    $0xb,%edi
     7cc:	b8 00 00 00 00       	mov    $0x0,%eax
     7d1:	e8 cb f8 ff ff       	call   a1 <UVM_Inv_Act_Dummy>
            end=__UVM_X64_Read_TSC();
     7d6:	e8 42 f8 ff ff       	call   1d <__UVM_X64_Read_TSC>
     7db:	48 89 05 36 18 00 00 	mov    %rax,0x1836(%rip)        # 2018 <end>
            sum+=end-start;
     7e2:	48 8b 15 2f 18 00 00 	mov    0x182f(%rip),%rdx        # 2018 <end>
     7e9:	48 8b 05 18 18 00 00 	mov    0x1818(%rip),%rax        # 2008 <start>
     7f0:	48 29 c2             	sub    %rax,%rdx
     7f3:	48 8b 05 26 18 00 00 	mov    0x1826(%rip),%rax        # 2020 <sum>
     7fa:	48 01 d0             	add    %rdx,%rax
     7fd:	48 89 05 1c 18 00 00 	mov    %rax,0x181c(%rip)        # 2020 <sum>
        for(Count=0;Count<1000000;Count++)
     804:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     809:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
     810:	00 
     811:	7e 9e                	jle    7b1 <main+0x513>
        }
        UVM_LOG_S("\r\ninv-dummy");
     813:	bf d1 1c 00 00       	mov    $0x1cd1,%edi
     818:	e8 b6 08 00 00       	call   10d3 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
     81d:	48 8b 05 fc 17 00 00 	mov    0x17fc(%rip),%rax        # 2020 <sum>
     824:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     82b:	de 1b 43 
     82e:	48 f7 e2             	mul    %rdx
     831:	48 89 d0             	mov    %rdx,%rax
     834:	48 c1 e8 12          	shr    $0x12,%rax
     838:	48 89 c7             	mov    %rax,%rdi
     83b:	e8 d1 05 00 00       	call   e11 <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*6, sum/1000000, 0);
     840:	48 8b 05 d9 17 00 00 	mov    0x17d9(%rip),%rax        # 2020 <sum>
     847:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     84e:	de 1b 43 
     851:	48 f7 e2             	mul    %rdx
     854:	48 89 d0             	mov    %rdx,%rax
     857:	48 c1 e8 12          	shr    $0x12,%rax
     85b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     861:	48 89 c1             	mov    %rax,%rcx
     864:	ba c0 03 00 00       	mov    $0x3c0,%edx
     869:	be 07 00 00 00       	mov    $0x7,%esi
     86e:	bf 04 00 00 00       	mov    $0x4,%edi
     873:	e8 92 0b 00 00       	call   140a <UVM_Kern_Act>

        /* crazyopt test - single callq/retq */
        sum=0;
     878:	48 c7 05 9d 17 00 00 	movq   $0x0,0x179d(%rip)        # 2020 <sum>
     87f:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
     883:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     88a:	00 
     88b:	eb 53                	jmp    8e0 <main+0x642>
        {
            start=__UVM_X64_Read_TSC();
     88d:	e8 8b f7 ff ff       	call   1d <__UVM_X64_Read_TSC>
     892:	48 89 05 6f 17 00 00 	mov    %rax,0x176f(%rip)        # 2008 <start>
            UVM_cret(0,0);
     899:	be 00 00 00 00       	mov    $0x0,%esi
     89e:	bf 00 00 00 00       	mov    $0x0,%edi
     8a3:	b8 00 00 00 00       	mov    $0x0,%eax
     8a8:	e8 38 f8 ff ff       	call   e5 <UVM_cret>
            end=__UVM_X64_Read_TSC();
     8ad:	e8 6b f7 ff ff       	call   1d <__UVM_X64_Read_TSC>
     8b2:	48 89 05 5f 17 00 00 	mov    %rax,0x175f(%rip)        # 2018 <end>
            sum+=end-start;
     8b9:	48 8b 15 58 17 00 00 	mov    0x1758(%rip),%rdx        # 2018 <end>
     8c0:	48 8b 05 41 17 00 00 	mov    0x1741(%rip),%rax        # 2008 <start>
     8c7:	48 29 c2             	sub    %rax,%rdx
     8ca:	48 8b 05 4f 17 00 00 	mov    0x174f(%rip),%rax        # 2020 <sum>
     8d1:	48 01 d0             	add    %rdx,%rax
     8d4:	48 89 05 45 17 00 00 	mov    %rax,0x1745(%rip)        # 2020 <sum>
        for(Count=0;Count<1000000;Count++)
     8db:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     8e0:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
     8e7:	00 
     8e8:	7e a3                	jle    88d <main+0x5ef>
        }
        UVM_LOG_S("\r\ncallret");
     8ea:	bf dd 1c 00 00       	mov    $0x1cdd,%edi
     8ef:	e8 df 07 00 00       	call   10d3 <UVM_Print_String>
        UVM_LOG_I(sum/(1000000/10));
     8f4:	48 8b 05 25 17 00 00 	mov    0x1725(%rip),%rax        # 2020 <sum>
     8fb:	48 c1 e8 05          	shr    $0x5,%rax
     8ff:	48 ba 43 78 b4 71 c4 	movabs $0xa7c5ac471b47843,%rdx
     906:	5a 7c 0a 
     909:	48 f7 e2             	mul    %rdx
     90c:	48 89 d0             	mov    %rdx,%rax
     90f:	48 c1 e8 07          	shr    $0x7,%rax
     913:	48 89 c7             	mov    %rax,%rdi
     916:	e8 f6 04 00 00       	call   e11 <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*7, sum/1000000, 0);
     91b:	48 8b 05 fe 16 00 00 	mov    0x16fe(%rip),%rax        # 2020 <sum>
     922:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     929:	de 1b 43 
     92c:	48 f7 e2             	mul    %rdx
     92f:	48 89 d0             	mov    %rdx,%rax
     932:	48 c1 e8 12          	shr    $0x12,%rax
     936:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     93c:	48 89 c1             	mov    %rax,%rcx
     93f:	ba 60 04 00 00       	mov    $0x460,%edx
     944:	be 07 00 00 00       	mov    $0x7,%esi
     949:	bf 04 00 00 00       	mov    $0x4,%edi
     94e:	e8 b7 0a 00 00       	call   140a <UVM_Kern_Act>

        /* We create this in Kmem1 */
        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     953:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     957:	49 89 c1             	mov    %rax,%r9
     95a:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     960:	b9 02 00 00 00       	mov    $0x2,%ecx
     965:	ba 09 00 00 00       	mov    $0x9,%edx
     96a:	be 00 80 05 00       	mov    $0x58000,%esi
     96f:	bf 00 00 00 00       	mov    $0x0,%edi
     974:	e8 d7 0d 00 00       	call   1750 <UVM_Thd_Crt>
     979:	48 85 c0             	test   %rax,%rax
     97c:	79 5d                	jns    9db <main+0x73d>
     97e:	bf 60 1c 00 00       	mov    $0x1c60,%edi
     983:	e8 4b 07 00 00       	call   10d3 <UVM_Print_String>
     988:	bf 91 1c 00 00       	mov    $0x1c91,%edi
     98d:	e8 41 07 00 00       	call   10d3 <UVM_Print_String>
     992:	bf 9d 1c 00 00       	mov    $0x1c9d,%edi
     997:	e8 37 07 00 00       	call   10d3 <UVM_Print_String>
     99c:	bf e9 00 00 00       	mov    $0xe9,%edi
     9a1:	e8 6b 04 00 00       	call   e11 <UVM_Print_Int>
     9a6:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     9ab:	e8 23 07 00 00       	call   10d3 <UVM_Print_String>
     9b0:	bf a8 1c 00 00       	mov    $0x1ca8,%edi
     9b5:	e8 19 07 00 00       	call   10d3 <UVM_Print_String>
     9ba:	bf b4 1c 00 00       	mov    $0x1cb4,%edi
     9bf:	e8 0f 07 00 00       	call   10d3 <UVM_Print_String>
     9c4:	bf b7 1c 00 00       	mov    $0x1cb7,%edi
     9c9:	e8 05 07 00 00       	call   10d3 <UVM_Print_String>
     9ce:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     9d3:	e8 fb 06 00 00       	call   10d3 <UVM_Print_String>
     9d8:	90                   	nop
     9d9:	eb fd                	jmp    9d8 <main+0x73a>
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     9db:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     9e1:	b9 00 00 00 00       	mov    $0x0,%ecx
     9e6:	b8 00 00 00 80       	mov    $0x80000000,%eax
     9eb:	48 89 c2             	mov    %rax,%rdx
     9ee:	be 00 80 03 00       	mov    $0x38000,%esi
     9f3:	bf 09 00 00 00       	mov    $0x9,%edi
     9f8:	e8 6c 0e 00 00       	call   1869 <UVM_Thd_Sched_Bind>
     9fd:	48 85 c0             	test   %rax,%rax
     a00:	79 5d                	jns    a5f <main+0x7c1>
     a02:	bf 60 1c 00 00       	mov    $0x1c60,%edi
     a07:	e8 c7 06 00 00       	call   10d3 <UVM_Print_String>
     a0c:	bf 91 1c 00 00       	mov    $0x1c91,%edi
     a11:	e8 bd 06 00 00       	call   10d3 <UVM_Print_String>
     a16:	bf 9d 1c 00 00       	mov    $0x1c9d,%edi
     a1b:	e8 b3 06 00 00       	call   10d3 <UVM_Print_String>
     a20:	bf ea 00 00 00       	mov    $0xea,%edi
     a25:	e8 e7 03 00 00       	call   e11 <UVM_Print_Int>
     a2a:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     a2f:	e8 9f 06 00 00       	call   10d3 <UVM_Print_String>
     a34:	bf a8 1c 00 00       	mov    $0x1ca8,%edi
     a39:	e8 95 06 00 00       	call   10d3 <UVM_Print_String>
     a3e:	bf b4 1c 00 00       	mov    $0x1cb4,%edi
     a43:	e8 8b 06 00 00       	call   10d3 <UVM_Print_String>
     a48:	bf b7 1c 00 00       	mov    $0x1cb7,%edi
     a4d:	e8 81 06 00 00       	call   10d3 <UVM_Print_String>
     a52:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     a57:	e8 77 06 00 00       	call   10d3 <UVM_Print_String>
     a5c:	90                   	nop
     a5d:	eb fd                	jmp    a5c <main+0x7be>
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     a5f:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
     a66:	ff ff 7f 
     a69:	48 89 c2             	mov    %rax,%rdx
     a6c:	be 00 80 03 00       	mov    $0x38000,%esi
     a71:	bf 09 00 00 00       	mov    $0x9,%edi
     a76:	e8 dd 0e 00 00       	call   1958 <UVM_Thd_Time_Xfer>
     a7b:	48 85 c0             	test   %rax,%rax
     a7e:	79 5d                	jns    add <main+0x83f>
     a80:	bf 60 1c 00 00       	mov    $0x1c60,%edi
     a85:	e8 49 06 00 00       	call   10d3 <UVM_Print_String>
     a8a:	bf 91 1c 00 00       	mov    $0x1c91,%edi
     a8f:	e8 3f 06 00 00       	call   10d3 <UVM_Print_String>
     a94:	bf 9d 1c 00 00       	mov    $0x1c9d,%edi
     a99:	e8 35 06 00 00       	call   10d3 <UVM_Print_String>
     a9e:	bf eb 00 00 00       	mov    $0xeb,%edi
     aa3:	e8 69 03 00 00       	call   e11 <UVM_Print_Int>
     aa8:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     aad:	e8 21 06 00 00       	call   10d3 <UVM_Print_String>
     ab2:	bf a8 1c 00 00       	mov    $0x1ca8,%edi
     ab7:	e8 17 06 00 00       	call   10d3 <UVM_Print_String>
     abc:	bf b4 1c 00 00       	mov    $0x1cb4,%edi
     ac1:	e8 0d 06 00 00       	call   10d3 <UVM_Print_String>
     ac6:	bf b7 1c 00 00       	mov    $0x1cb7,%edi
     acb:	e8 03 06 00 00       	call   10d3 <UVM_Print_String>
     ad0:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     ad5:	e8 f9 05 00 00       	call   10d3 <UVM_Print_String>
     ada:	90                   	nop
     adb:	eb fd                	jmp    ada <main+0x83c>
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD1,test,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     add:	b8 78 01 00 00       	mov    $0x178,%eax
     ae2:	b9 00 00 00 00       	mov    $0x0,%ecx
     ae7:	ba 00 00 c0 00       	mov    $0xc00000,%edx
     aec:	48 89 c6             	mov    %rax,%rsi
     aef:	bf 09 00 00 00       	mov    $0x9,%edi
     af4:	e8 fa 0c 00 00       	call   17f3 <UVM_Thd_Exec_Set>
     af9:	48 85 c0             	test   %rax,%rax
     afc:	79 5d                	jns    b5b <main+0x8bd>
     afe:	bf 60 1c 00 00       	mov    $0x1c60,%edi
     b03:	e8 cb 05 00 00       	call   10d3 <UVM_Print_String>
     b08:	bf 91 1c 00 00       	mov    $0x1c91,%edi
     b0d:	e8 c1 05 00 00       	call   10d3 <UVM_Print_String>
     b12:	bf 9d 1c 00 00       	mov    $0x1c9d,%edi
     b17:	e8 b7 05 00 00       	call   10d3 <UVM_Print_String>
     b1c:	bf ec 00 00 00       	mov    $0xec,%edi
     b21:	e8 eb 02 00 00       	call   e11 <UVM_Print_Int>
     b26:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     b2b:	e8 a3 05 00 00       	call   10d3 <UVM_Print_String>
     b30:	bf a8 1c 00 00       	mov    $0x1ca8,%edi
     b35:	e8 99 05 00 00       	call   10d3 <UVM_Print_String>
     b3a:	bf b4 1c 00 00       	mov    $0x1cb4,%edi
     b3f:	e8 8f 05 00 00       	call   10d3 <UVM_Print_String>
     b44:	bf b7 1c 00 00       	mov    $0x1cb7,%edi
     b49:	e8 85 05 00 00       	call   10d3 <UVM_Print_String>
     b4e:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     b53:	e8 7b 05 00 00       	call   10d3 <UVM_Print_String>
     b58:	90                   	nop
     b59:	eb fd                	jmp    b58 <main+0x8ba>

        Cur_Addr+=UVM_THD_SIZE;
     b5b:	48 81 45 f0 d0 09 00 	addq   $0x9d0,-0x10(%rbp)
     b62:	00 
        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     b63:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     b67:	49 89 c1             	mov    %rax,%r9
     b6a:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     b70:	b9 02 00 00 00       	mov    $0x2,%ecx
     b75:	ba 0a 00 00 00       	mov    $0xa,%edx
     b7a:	be 00 80 05 00       	mov    $0x58000,%esi
     b7f:	bf 00 00 00 00       	mov    $0x0,%edi
     b84:	e8 c7 0b 00 00       	call   1750 <UVM_Thd_Crt>
     b89:	48 85 c0             	test   %rax,%rax
     b8c:	79 5d                	jns    beb <main+0x94d>
     b8e:	bf 60 1c 00 00       	mov    $0x1c60,%edi
     b93:	e8 3b 05 00 00       	call   10d3 <UVM_Print_String>
     b98:	bf 91 1c 00 00       	mov    $0x1c91,%edi
     b9d:	e8 31 05 00 00       	call   10d3 <UVM_Print_String>
     ba2:	bf 9d 1c 00 00       	mov    $0x1c9d,%edi
     ba7:	e8 27 05 00 00       	call   10d3 <UVM_Print_String>
     bac:	bf ef 00 00 00       	mov    $0xef,%edi
     bb1:	e8 5b 02 00 00       	call   e11 <UVM_Print_Int>
     bb6:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     bbb:	e8 13 05 00 00       	call   10d3 <UVM_Print_String>
     bc0:	bf a8 1c 00 00       	mov    $0x1ca8,%edi
     bc5:	e8 09 05 00 00       	call   10d3 <UVM_Print_String>
     bca:	bf b4 1c 00 00       	mov    $0x1cb4,%edi
     bcf:	e8 ff 04 00 00       	call   10d3 <UVM_Print_String>
     bd4:	bf b7 1c 00 00       	mov    $0x1cb7,%edi
     bd9:	e8 f5 04 00 00       	call   10d3 <UVM_Print_String>
     bde:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     be3:	e8 eb 04 00 00       	call   10d3 <UVM_Print_String>
     be8:	90                   	nop
     be9:	eb fd                	jmp    be8 <main+0x94a>
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     beb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     bf1:	b9 00 00 00 00       	mov    $0x0,%ecx
     bf6:	b8 00 00 00 80       	mov    $0x80000000,%eax
     bfb:	48 89 c2             	mov    %rax,%rdx
     bfe:	be 00 80 03 00       	mov    $0x38000,%esi
     c03:	bf 0a 00 00 00       	mov    $0xa,%edi
     c08:	e8 5c 0c 00 00       	call   1869 <UVM_Thd_Sched_Bind>
     c0d:	48 85 c0             	test   %rax,%rax
     c10:	79 5d                	jns    c6f <main+0x9d1>
     c12:	bf 60 1c 00 00       	mov    $0x1c60,%edi
     c17:	e8 b7 04 00 00       	call   10d3 <UVM_Print_String>
     c1c:	bf 91 1c 00 00       	mov    $0x1c91,%edi
     c21:	e8 ad 04 00 00       	call   10d3 <UVM_Print_String>
     c26:	bf 9d 1c 00 00       	mov    $0x1c9d,%edi
     c2b:	e8 a3 04 00 00       	call   10d3 <UVM_Print_String>
     c30:	bf f0 00 00 00       	mov    $0xf0,%edi
     c35:	e8 d7 01 00 00       	call   e11 <UVM_Print_Int>
     c3a:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     c3f:	e8 8f 04 00 00       	call   10d3 <UVM_Print_String>
     c44:	bf a8 1c 00 00       	mov    $0x1ca8,%edi
     c49:	e8 85 04 00 00       	call   10d3 <UVM_Print_String>
     c4e:	bf b4 1c 00 00       	mov    $0x1cb4,%edi
     c53:	e8 7b 04 00 00       	call   10d3 <UVM_Print_String>
     c58:	bf b7 1c 00 00       	mov    $0x1cb7,%edi
     c5d:	e8 71 04 00 00       	call   10d3 <UVM_Print_String>
     c62:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     c67:	e8 67 04 00 00       	call   10d3 <UVM_Print_String>
     c6c:	90                   	nop
     c6d:	eb fd                	jmp    c6c <main+0x9ce>
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     c6f:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
     c76:	ff ff 7f 
     c79:	48 89 c2             	mov    %rax,%rdx
     c7c:	be 00 80 03 00       	mov    $0x38000,%esi
     c81:	bf 0a 00 00 00       	mov    $0xa,%edi
     c86:	e8 cd 0c 00 00       	call   1958 <UVM_Thd_Time_Xfer>
     c8b:	48 85 c0             	test   %rax,%rax
     c8e:	79 5d                	jns    ced <main+0xa4f>
     c90:	bf 60 1c 00 00       	mov    $0x1c60,%edi
     c95:	e8 39 04 00 00       	call   10d3 <UVM_Print_String>
     c9a:	bf 91 1c 00 00       	mov    $0x1c91,%edi
     c9f:	e8 2f 04 00 00       	call   10d3 <UVM_Print_String>
     ca4:	bf 9d 1c 00 00       	mov    $0x1c9d,%edi
     ca9:	e8 25 04 00 00       	call   10d3 <UVM_Print_String>
     cae:	bf f1 00 00 00       	mov    $0xf1,%edi
     cb3:	e8 59 01 00 00       	call   e11 <UVM_Print_Int>
     cb8:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     cbd:	e8 11 04 00 00       	call   10d3 <UVM_Print_String>
     cc2:	bf a8 1c 00 00       	mov    $0x1ca8,%edi
     cc7:	e8 07 04 00 00       	call   10d3 <UVM_Print_String>
     ccc:	bf b4 1c 00 00       	mov    $0x1cb4,%edi
     cd1:	e8 fd 03 00 00       	call   10d3 <UVM_Print_String>
     cd6:	bf b7 1c 00 00       	mov    $0x1cb7,%edi
     cdb:	e8 f3 03 00 00       	call   10d3 <UVM_Print_String>
     ce0:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     ce5:	e8 e9 03 00 00       	call   10d3 <UVM_Print_String>
     cea:	90                   	nop
     ceb:	eb fd                	jmp    cea <main+0xa4c>
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD2,test2,13*UVM_POW2(RME_PGT_SIZE_1M),1)>=0);
     ced:	b8 55 02 00 00       	mov    $0x255,%eax
     cf2:	b9 01 00 00 00       	mov    $0x1,%ecx
     cf7:	ba 00 00 d0 00       	mov    $0xd00000,%edx
     cfc:	48 89 c6             	mov    %rax,%rsi
     cff:	bf 0a 00 00 00       	mov    $0xa,%edi
     d04:	e8 ea 0a 00 00       	call   17f3 <UVM_Thd_Exec_Set>
     d09:	48 85 c0             	test   %rax,%rax
     d0c:	79 5d                	jns    d6b <main+0xacd>
     d0e:	bf 60 1c 00 00       	mov    $0x1c60,%edi
     d13:	e8 bb 03 00 00       	call   10d3 <UVM_Print_String>
     d18:	bf 91 1c 00 00       	mov    $0x1c91,%edi
     d1d:	e8 b1 03 00 00       	call   10d3 <UVM_Print_String>
     d22:	bf 9d 1c 00 00       	mov    $0x1c9d,%edi
     d27:	e8 a7 03 00 00       	call   10d3 <UVM_Print_String>
     d2c:	bf f2 00 00 00       	mov    $0xf2,%edi
     d31:	e8 db 00 00 00       	call   e11 <UVM_Print_Int>
     d36:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     d3b:	e8 93 03 00 00       	call   10d3 <UVM_Print_String>
     d40:	bf a8 1c 00 00       	mov    $0x1ca8,%edi
     d45:	e8 89 03 00 00       	call   10d3 <UVM_Print_String>
     d4a:	bf b4 1c 00 00       	mov    $0x1cb4,%edi
     d4f:	e8 7f 03 00 00       	call   10d3 <UVM_Print_String>
     d54:	bf b7 1c 00 00       	mov    $0x1cb7,%edi
     d59:	e8 75 03 00 00       	call   10d3 <UVM_Print_String>
     d5e:	bf a5 1c 00 00       	mov    $0x1ca5,%edi
     d63:	e8 6b 03 00 00       	call   10d3 <UVM_Print_String>
     d68:	90                   	nop
     d69:	eb fd                	jmp    d68 <main+0xaca>

        UVM_Thd_Swt(TEST_THD1,0);
     d6b:	be 00 00 00 00       	mov    $0x0,%esi
     d70:	bf 09 00 00 00       	mov    $0x9,%edi
     d75:	e8 15 0c 00 00       	call   198f <UVM_Thd_Swt>
        UVM_LOG_S("\r\nShould not get here");
     d7a:	bf e7 1c 00 00       	mov    $0x1ce7,%edi
     d7f:	e8 4f 03 00 00       	call   10d3 <UVM_Print_String>
core-local ctxsw wrt.cores
core-local IPC wrt.cores
map/unmap pages wrt.cores
WCIRT*/

    while(1);
     d84:	90                   	nop
     d85:	90                   	nop
     d86:	eb fd                	jmp    d85 <main+0xae7>

0000000000000d88 <UVM_List_Crt>:
Input       : volatile struct UVM_List* Head - The pointer to the list head.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Crt(volatile struct UVM_List* Head)
{
     d88:	55                   	push   %rbp
     d89:	48 89 e5             	mov    %rsp,%rbp
     d8c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    Head->Prev=(struct UVM_List*)Head;
     d90:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d94:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     d98:	48 89 10             	mov    %rdx,(%rax)
    Head->Next=(struct UVM_List*)Head;
     d9b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     d9f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     da3:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
     da7:	90                   	nop
     da8:	5d                   	pop    %rbp
     da9:	c3                   	ret

0000000000000daa <UVM_List_Del>:
              volatile struct UVM_List* Next - The next node of the target node.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Del(volatile struct UVM_List* Prev,volatile struct UVM_List* Next)
{
     daa:	55                   	push   %rbp
     dab:	48 89 e5             	mov    %rsp,%rbp
     dae:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     db2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    Next->Prev=(struct UVM_List*)Prev;
     db6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     dba:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     dbe:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)Next;
     dc1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     dc5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     dc9:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
     dcd:	90                   	nop
     dce:	5d                   	pop    %rbp
     dcf:	c3                   	ret

0000000000000dd0 <UVM_List_Ins>:
Return      : None.
******************************************************************************/
void UVM_List_Ins(volatile struct UVM_List* New,
                  volatile struct UVM_List* Prev,
                  volatile struct UVM_List* Next)
{
     dd0:	55                   	push   %rbp
     dd1:	48 89 e5             	mov    %rsp,%rbp
     dd4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     dd8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     ddc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    Next->Prev=(struct UVM_List*)New;
     de0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     de4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     de8:	48 89 10             	mov    %rdx,(%rax)
    New->Next=(struct UVM_List*)Next;
     deb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     def:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
     df3:	48 89 50 08          	mov    %rdx,0x8(%rax)
    New->Prev=(struct UVM_List*)Prev;
     df7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     dfb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     dff:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)New;
     e02:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e06:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     e0a:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
     e0e:	90                   	nop
     e0f:	5d                   	pop    %rbp
     e10:	c3                   	ret

0000000000000e11 <UVM_Print_Int>:
Input       : cnt_t Int - The integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Int(cnt_t Int)
{
     e11:	55                   	push   %rbp
     e12:	48 89 e5             	mov    %rsp,%rbp
     e15:	48 83 ec 30          	sub    $0x30,%rsp
     e19:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    cnt_t Count;
    cnt_t Num;
    ptr_t Div;
    
    /* how many digits are there? */
    if(Int==0)
     e1d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
     e22:	75 14                	jne    e38 <UVM_Print_Int+0x27>
    {
        UVM_Putchar('0');
     e24:	bf 30 00 00 00       	mov    $0x30,%edi
     e29:	e8 5b 0d 00 00       	call   1b89 <UVM_Putchar>
        return 1;
     e2e:	b8 01 00 00 00       	mov    $0x1,%eax
     e33:	e9 d8 01 00 00       	jmp    1010 <UVM_Print_Int+0x1ff>
    }
    else if(Int<0)
     e38:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
     e3d:	0f 89 f1 00 00 00    	jns    f34 <UVM_Print_Int+0x123>
    {
        /* How many digits are there? */
        Count=0;
     e43:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
     e4a:	00 
        Div=1;
     e4b:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
     e52:	00 
        Iter=-Int;
     e53:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     e57:	48 f7 d8             	neg    %rax
     e5a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
     e5e:	eb 36                	jmp    e96 <UVM_Print_Int+0x85>
        {
            Iter/=10;
     e60:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e64:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     e6b:	cc cc cc 
     e6e:	48 f7 e2             	mul    %rdx
     e71:	48 89 d0             	mov    %rdx,%rax
     e74:	48 c1 e8 03          	shr    $0x3,%rax
     e78:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
     e7c:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
     e81:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     e85:	48 89 d0             	mov    %rdx,%rax
     e88:	48 c1 e0 02          	shl    $0x2,%rax
     e8c:	48 01 d0             	add    %rdx,%rax
     e8f:	48 01 c0             	add    %rax,%rax
     e92:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
     e96:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
     e9b:	75 c3                	jne    e60 <UVM_Print_Int+0x4f>
        }
        Div/=10;
     e9d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     ea1:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     ea8:	cc cc cc 
     eab:	48 f7 e2             	mul    %rdx
     eae:	48 89 d0             	mov    %rdx,%rax
     eb1:	48 c1 e8 03          	shr    $0x3,%rax
     eb5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        UVM_Putchar('-');
     eb9:	bf 2d 00 00 00       	mov    $0x2d,%edi
     ebe:	e8 c6 0c 00 00       	call   1b89 <UVM_Putchar>
        Iter=-Int;
     ec3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     ec7:	48 f7 d8             	neg    %rax
     eca:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count+1;
     ece:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     ed2:	48 83 c0 01          	add    $0x1,%rax
     ed6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
     eda:	eb 4c                	jmp    f28 <UVM_Print_Int+0x117>
        {
            Count--;
     edc:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
     ee1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ee5:	ba 00 00 00 00       	mov    $0x0,%edx
     eea:	48 f7 75 e0          	divq   -0x20(%rbp)
     eee:	83 c0 30             	add    $0x30,%eax
     ef1:	0f be c0             	movsbl %al,%eax
     ef4:	89 c7                	mov    %eax,%edi
     ef6:	e8 8e 0c 00 00       	call   1b89 <UVM_Putchar>
            Iter=Iter%Div;
     efb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     eff:	ba 00 00 00 00       	mov    $0x0,%edx
     f04:	48 f7 75 e0          	divq   -0x20(%rbp)
     f08:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
     f0c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     f10:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     f17:	cc cc cc 
     f1a:	48 f7 e2             	mul    %rdx
     f1d:	48 89 d0             	mov    %rdx,%rax
     f20:	48 c1 e8 03          	shr    $0x3,%rax
     f24:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
     f28:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
     f2d:	7f ad                	jg     edc <UVM_Print_Int+0xcb>
     f2f:	e9 d8 00 00 00       	jmp    100c <UVM_Print_Int+0x1fb>
        }
    }
    else
    {
        /* How many digits are there? */
        Count=0;
     f34:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
     f3b:	00 
        Div=1;
     f3c:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
     f43:	00 
        Iter=Int;
     f44:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     f48:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
     f4c:	eb 36                	jmp    f84 <UVM_Print_Int+0x173>
        {
            Iter/=10;
     f4e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f52:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     f59:	cc cc cc 
     f5c:	48 f7 e2             	mul    %rdx
     f5f:	48 89 d0             	mov    %rdx,%rax
     f62:	48 c1 e8 03          	shr    $0x3,%rax
     f66:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
     f6a:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
     f6f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     f73:	48 89 d0             	mov    %rdx,%rax
     f76:	48 c1 e0 02          	shl    $0x2,%rax
     f7a:	48 01 d0             	add    %rdx,%rax
     f7d:	48 01 c0             	add    %rax,%rax
     f80:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
     f84:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
     f89:	75 c3                	jne    f4e <UVM_Print_Int+0x13d>
        }
        Div/=10;
     f8b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     f8f:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     f96:	cc cc cc 
     f99:	48 f7 e2             	mul    %rdx
     f9c:	48 89 d0             	mov    %rdx,%rax
     f9f:	48 c1 e8 03          	shr    $0x3,%rax
     fa3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        Iter=Int;
     fa7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     fab:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count;
     faf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     fb3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
     fb7:	eb 4c                	jmp    1005 <UVM_Print_Int+0x1f4>
        {
            Count--;
     fb9:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
     fbe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     fc2:	ba 00 00 00 00       	mov    $0x0,%edx
     fc7:	48 f7 75 e0          	divq   -0x20(%rbp)
     fcb:	83 c0 30             	add    $0x30,%eax
     fce:	0f be c0             	movsbl %al,%eax
     fd1:	89 c7                	mov    %eax,%edi
     fd3:	e8 b1 0b 00 00       	call   1b89 <UVM_Putchar>
            Iter=Iter%Div;
     fd8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     fdc:	ba 00 00 00 00       	mov    $0x0,%edx
     fe1:	48 f7 75 e0          	divq   -0x20(%rbp)
     fe5:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
     fe9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     fed:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     ff4:	cc cc cc 
     ff7:	48 f7 e2             	mul    %rdx
     ffa:	48 89 d0             	mov    %rdx,%rax
     ffd:	48 c1 e8 03          	shr    $0x3,%rax
    1001:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
    1005:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    100a:	7f ad                	jg     fb9 <UVM_Print_Int+0x1a8>
        }
    }
    
    return Num;
    100c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
    1010:	c9                   	leave
    1011:	c3                   	ret

0000000000001012 <UVM_Print_Uint>:
Input       : ptr_t Uint - The unsigned integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Uint(ptr_t Uint)
{
    1012:	55                   	push   %rbp
    1013:	48 89 e5             	mov    %rsp,%rbp
    1016:	48 83 ec 30          	sub    $0x30,%rsp
    101a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    ptr_t Iter;
    cnt_t Count;
    cnt_t Num;
    
    /* how many digits are there? */
    if(Uint==0)
    101e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    1023:	75 14                	jne    1039 <UVM_Print_Uint+0x27>
    {
        UVM_Putchar('0');
    1025:	bf 30 00 00 00       	mov    $0x30,%edi
    102a:	e8 5a 0b 00 00       	call   1b89 <UVM_Putchar>
        return 1;
    102f:	b8 01 00 00 00       	mov    $0x1,%eax
    1034:	e9 98 00 00 00       	jmp    10d1 <UVM_Print_Uint+0xbf>
    }
    else
    {
        /* Filter out all the zeroes */
        Count=0;
    1039:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    1040:	00 
        Iter=Uint;
    1041:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1045:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    1049:	eb 0a                	jmp    1055 <UVM_Print_Uint+0x43>
        {
            Iter<<=4;
    104b:	48 c1 65 f8 04       	shlq   $0x4,-0x8(%rbp)
            Count++;
    1050:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    1055:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1059:	48 c1 e8 3c          	shr    $0x3c,%rax
    105d:	48 85 c0             	test   %rax,%rax
    1060:	74 e9                	je     104b <UVM_Print_Uint+0x39>
        }
        /* Count is the number of pts to print */
        Count=sizeof(ptr_t)*2-Count;
    1062:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1066:	ba 10 00 00 00       	mov    $0x10,%edx
    106b:	48 29 c2             	sub    %rax,%rdx
    106e:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
        Num=Count;
    1072:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1076:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        while(Count>0)
    107a:	eb 4a                	jmp    10c6 <UVM_Print_Uint+0xb4>
        {
            Count--;
    107c:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            Iter=(Uint>>(Count*4))&0x0F;
    1081:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1085:	c1 e0 02             	shl    $0x2,%eax
    1088:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    108c:	89 c1                	mov    %eax,%ecx
    108e:	48 d3 ea             	shr    %cl,%rdx
    1091:	48 89 d0             	mov    %rdx,%rax
    1094:	83 e0 0f             	and    $0xf,%eax
    1097:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            if(Iter<10)
    109b:	48 83 7d f8 09       	cmpq   $0x9,-0x8(%rbp)
    10a0:	77 13                	ja     10b5 <UVM_Print_Uint+0xa3>
                UVM_Putchar('0'+Iter);
    10a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    10a6:	83 c0 30             	add    $0x30,%eax
    10a9:	0f be c0             	movsbl %al,%eax
    10ac:	89 c7                	mov    %eax,%edi
    10ae:	e8 d6 0a 00 00       	call   1b89 <UVM_Putchar>
    10b3:	eb 11                	jmp    10c6 <UVM_Print_Uint+0xb4>
            else
                UVM_Putchar('A'+Iter-10);
    10b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    10b9:	83 c0 37             	add    $0x37,%eax
    10bc:	0f be c0             	movsbl %al,%eax
    10bf:	89 c7                	mov    %eax,%edi
    10c1:	e8 c3 0a 00 00       	call   1b89 <UVM_Putchar>
        while(Count>0)
    10c6:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    10cb:	7f af                	jg     107c <UVM_Print_Uint+0x6a>
        }
    }
    
    return Num;
    10cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
    10d1:	c9                   	leave
    10d2:	c3                   	ret

00000000000010d3 <UVM_Print_String>:
Input       : s8* String - The string to print.
Output      : None.
Return      : cnt_t - The length of the string printed, the '\0' is not included.
******************************************************************************/
cnt_t UVM_Print_String(s8* String)
{
    10d3:	55                   	push   %rbp
    10d4:	48 89 e5             	mov    %rsp,%rbp
    10d7:	48 83 ec 20          	sub    $0x20,%rsp
    10db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    cnt_t Count;
    
    Count=0;
    10df:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    10e6:	00 
    while(Count<UVM_USER_DEBUG_MAX_STR)
    10e7:	eb 35                	jmp    111e <UVM_Print_String+0x4b>
    {
        if(String[Count]=='\0')
    10e9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    10ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    10f1:	48 01 d0             	add    %rdx,%rax
    10f4:	0f b6 00             	movzbl (%rax),%eax
    10f7:	84 c0                	test   %al,%al
    10f9:	74 2c                	je     1127 <UVM_Print_String+0x54>
            break;
        
        UVM_Putchar(String[Count++]);
    10fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    10ff:	48 8d 50 01          	lea    0x1(%rax),%rdx
    1103:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    1107:	48 89 c2             	mov    %rax,%rdx
    110a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    110e:	48 01 d0             	add    %rdx,%rax
    1111:	0f b6 00             	movzbl (%rax),%eax
    1114:	0f be c0             	movsbl %al,%eax
    1117:	89 c7                	mov    %eax,%edi
    1119:	e8 6b 0a 00 00       	call   1b89 <UVM_Putchar>
    while(Count<UVM_USER_DEBUG_MAX_STR)
    111e:	48 83 7d f8 7f       	cmpq   $0x7f,-0x8(%rbp)
    1123:	7e c4                	jle    10e9 <UVM_Print_String+0x16>
    1125:	eb 01                	jmp    1128 <UVM_Print_String+0x55>
            break;
    1127:	90                   	nop
    }
    
    return Count;
    1128:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    112c:	c9                   	leave
    112d:	c3                   	ret

000000000000112e <UVM_Captbl_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, 
                     cid_t Cap_Captbl, ptr_t Vaddr, ptr_t Entry_Num)
{
    112e:	55                   	push   %rbp
    112f:	48 89 e5             	mov    %rsp,%rbp
    1132:	48 83 ec 30          	sub    $0x30,%rsp
    1136:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    113a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    113e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1142:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1146:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
    114a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    114e:	48 c1 e0 20          	shl    $0x20,%rax
    1152:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1156:	89 d2                	mov    %edx,%edx
    1158:	48 09 d0             	or     %rdx,%rax
    115b:	48 89 c6             	mov    %rax,%rsi
    115e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1162:	48 ba 00 00 00 00 0a 	movabs $0xa00000000,%rdx
    1169:	00 00 00 
    116c:	48 09 d0             	or     %rdx,%rax
    116f:	48 89 c7             	mov    %rax,%rdi
    1172:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    1176:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    117a:	48 89 d1             	mov    %rdx,%rcx
    117d:	48 89 c2             	mov    %rax,%rdx
    1180:	e8 6a ef ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Captbl),
                      Vaddr,
                      Entry_Num);
}
    1185:	c9                   	leave
    1186:	c3                   	ret

0000000000001187 <UVM_Captbl_Del>:
              cid_t Cap_Del - The capability to the capability table to be deleted. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Del(cid_t Cap_Captbl_Del, cid_t Cap_Del)
{
    1187:	55                   	push   %rbp
    1188:	48 89 e5             	mov    %rsp,%rbp
    118b:	48 83 ec 10          	sub    $0x10,%rsp
    118f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1193:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_DEL, Cap_Captbl_Del,
    1197:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    119b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    119f:	48 b9 00 00 00 00 0b 	movabs $0xb00000000,%rcx
    11a6:	00 00 00 
    11a9:	48 09 ca             	or     %rcx,%rdx
    11ac:	48 89 d7             	mov    %rdx,%rdi
    11af:	b9 00 00 00 00       	mov    $0x0,%ecx
    11b4:	ba 00 00 00 00       	mov    $0x0,%edx
    11b9:	48 89 c6             	mov    %rax,%rsi
    11bc:	e8 2e ef ff ff       	call   ef <UVM_Svc>
                      Cap_Del,
                      0,
                      0);
}
    11c1:	c9                   	leave
    11c2:	c3                   	ret

00000000000011c3 <UVM_Captbl_Frz>:
              cid_t Cap_Frz - The cap to the kernel object being freezed. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Frz(cid_t Cap_Captbl_Frz, cid_t Cap_Frz)
{
    11c3:	55                   	push   %rbp
    11c4:	48 89 e5             	mov    %rsp,%rbp
    11c7:	48 83 ec 10          	sub    $0x10,%rsp
    11cb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    11cf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
        return UVM_CAP_OP(RME_SVC_CPT_FRZ, Cap_Captbl_Frz,
    11d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11d7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    11db:	48 b9 00 00 00 00 0c 	movabs $0xc00000000,%rcx
    11e2:	00 00 00 
    11e5:	48 09 ca             	or     %rcx,%rdx
    11e8:	48 89 d7             	mov    %rdx,%rdi
    11eb:	b9 00 00 00 00       	mov    $0x0,%ecx
    11f0:	ba 00 00 00 00       	mov    $0x0,%edx
    11f5:	48 89 c6             	mov    %rax,%rsi
    11f8:	e8 f2 ee ff ff       	call   ef <UVM_Svc>
                          Cap_Frz,
                          0,
                          0);
}
    11fd:	c9                   	leave
    11fe:	c3                   	ret

00000000000011ff <UVM_Captbl_Add>:
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Add(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                     cid_t Cap_Captbl_Src, cid_t Cap_Src, ptr_t Flags)
{
    11ff:	55                   	push   %rbp
    1200:	48 89 e5             	mov    %rsp,%rbp
    1203:	48 83 ec 30          	sub    $0x30,%rsp
    1207:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    120b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    120f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1213:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1217:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    121b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    121f:	48 c1 e0 20          	shl    $0x20,%rax
    1223:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    1227:	89 d2                	mov    %edx,%edx
    1229:	48 09 c2             	or     %rax,%rdx
    122c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1230:	48 c1 e0 20          	shl    $0x20,%rax
    1234:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1238:	89 c9                	mov    %ecx,%ecx
    123a:	48 09 c8             	or     %rcx,%rax
    123d:	48 89 c6             	mov    %rax,%rsi
    1240:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1244:	48 89 c1             	mov    %rax,%rcx
    1247:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    124e:	00 00 00 
    1251:	48 89 c7             	mov    %rax,%rdi
    1254:	e8 96 ee ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),Flags);
}
    1259:	c9                   	leave
    125a:	c3                   	ret

000000000000125b <UVM_Captbl_Pgtbl>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Pgtbl(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                       cid_t Cap_Captbl_Src, cid_t Cap_Src,
                       ptr_t Start, ptr_t End, ptr_t Flags)
{
    125b:	55                   	push   %rbp
    125c:	48 89 e5             	mov    %rsp,%rbp
    125f:	48 83 ec 30          	sub    $0x30,%rsp
    1263:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1267:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    126b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    126f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1273:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    1277:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    127b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    127f:	48 c1 e0 24          	shl    $0x24,%rax
    1283:	48 89 c2             	mov    %rax,%rdx
    1286:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    128a:	48 c1 e0 08          	shl    $0x8,%rax
    128e:	48 09 d0             	or     %rdx,%rax
    1291:	48 0b 45 10          	or     0x10(%rbp),%rax
    1295:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1299:	48 c1 e2 20          	shl    $0x20,%rdx
    129d:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    12a1:	89 c9                	mov    %ecx,%ecx
    12a3:	48 09 ca             	or     %rcx,%rdx
    12a6:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    12aa:	48 c1 e1 20          	shl    $0x20,%rcx
    12ae:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    12b2:	89 f6                	mov    %esi,%esi
    12b4:	48 09 ce             	or     %rcx,%rsi
    12b7:	48 89 c1             	mov    %rax,%rcx
    12ba:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    12c1:	00 00 00 
    12c4:	48 89 c7             	mov    %rax,%rdi
    12c7:	e8 23 ee ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_PGTBL_FLAG(End,Start,Flags));
}
    12cc:	c9                   	leave
    12cd:	c3                   	ret

00000000000012ce <UVM_Captbl_Kern>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kern(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End)
{
    12ce:	55                   	push   %rbp
    12cf:	48 89 e5             	mov    %rsp,%rbp
    12d2:	48 83 ec 30          	sub    $0x30,%rsp
    12d6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    12da:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    12de:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    12e2:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    12e6:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    12ea:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    12ee:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    12f2:	48 c1 e0 20          	shl    $0x20,%rax
    12f6:	48 0b 45 d8          	or     -0x28(%rbp),%rax
    12fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    12fe:	48 c1 e2 20          	shl    $0x20,%rdx
    1302:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    1306:	89 c9                	mov    %ecx,%ecx
    1308:	48 09 ca             	or     %rcx,%rdx
    130b:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    130f:	48 c1 e1 20          	shl    $0x20,%rcx
    1313:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    1317:	89 f6                	mov    %esi,%esi
    1319:	48 09 ce             	or     %rcx,%rsi
    131c:	48 89 c1             	mov    %rax,%rcx
    131f:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    1326:	00 00 00 
    1329:	48 89 c7             	mov    %rax,%rdi
    132c:	e8 be ed ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KERN_FLAG(End,Start));
}
    1331:	c9                   	leave
    1332:	c3                   	ret

0000000000001333 <UVM_Captbl_Kmem>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kmem(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End, ptr_t Flags)
{
    1333:	55                   	push   %rbp
    1334:	48 89 e5             	mov    %rsp,%rbp
    1337:	48 83 ec 30          	sub    $0x30,%rsp
    133b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    133f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1343:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1347:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    134b:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    134f:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(UVM_KMEM_SVC(End,RME_SVC_CPT_ADD), UVM_KMEM_CAPID(Start,Flags),
    1353:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
    135a:	ff ff ff 
    135d:	48 23 45 d0          	and    -0x30(%rbp),%rax
    1361:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    1365:	48 c1 ea 20          	shr    $0x20,%rdx
    1369:	48 09 d0             	or     %rdx,%rax
    136c:	48 89 c1             	mov    %rax,%rcx
    136f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1373:	48 c1 e0 20          	shl    $0x20,%rax
    1377:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    137b:	89 d2                	mov    %edx,%edx
    137d:	48 09 c2             	or     %rax,%rdx
    1380:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1384:	48 c1 e0 20          	shl    $0x20,%rax
    1388:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    138c:	89 f6                	mov    %esi,%esi
    138e:	48 09 c6             	or     %rax,%rsi
    1391:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1395:	48 c1 e8 06          	shr    $0x6,%rax
    1399:	48 c1 e0 26          	shl    $0x26,%rax
    139d:	48 89 c7             	mov    %rax,%rdi
    13a0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    13a4:	48 c1 e8 06          	shr    $0x6,%rax
    13a8:	48 c1 e0 26          	shl    $0x26,%rax
    13ac:	48 c1 e8 20          	shr    $0x20,%rax
    13b0:	48 0b 45 10          	or     0x10(%rbp),%rax
    13b4:	48 09 c7             	or     %rax,%rdi
    13b7:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    13be:	00 00 00 
    13c1:	48 09 f8             	or     %rdi,%rax
    13c4:	48 89 c7             	mov    %rax,%rdi
    13c7:	e8 23 ed ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KMEM_FLAG(End,Start));
}
    13cc:	c9                   	leave
    13cd:	c3                   	ret

00000000000013ce <UVM_Captbl_Rem>:
              cid_t Cap_Rem - The capability slot you want to remove. 1-Level.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Rem(cid_t Cap_Captbl_Rem, cid_t Cap_Rem)
{
    13ce:	55                   	push   %rbp
    13cf:	48 89 e5             	mov    %rsp,%rbp
    13d2:	48 83 ec 10          	sub    $0x10,%rsp
    13d6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    13da:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_REM, Cap_Captbl_Rem,
    13de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    13e2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    13e6:	48 b9 00 00 00 00 0e 	movabs $0xe00000000,%rcx
    13ed:	00 00 00 
    13f0:	48 09 ca             	or     %rcx,%rdx
    13f3:	48 89 d7             	mov    %rdx,%rdi
    13f6:	b9 00 00 00 00       	mov    $0x0,%ecx
    13fb:	ba 00 00 00 00       	mov    $0x0,%edx
    1400:	48 89 c6             	mov    %rax,%rsi
    1403:	e8 e7 ec ff ff       	call   ef <UVM_Svc>
                      Cap_Rem,
                      0,
                      0);
}
    1408:	c9                   	leave
    1409:	c3                   	ret

000000000000140a <UVM_Kern_Act>:
                      kernel function ever causes a context switch, it is responsible
                      for setting the return value. On failure, a context switch 
                      in the kernel fucntion is banned.
******************************************************************************/
ret_t UVM_Kern_Act(cid_t Cap_Kern, ptr_t Func_ID, ptr_t Sub_ID, ptr_t Param1, ptr_t Param2)
{
    140a:	55                   	push   %rbp
    140b:	48 89 e5             	mov    %rsp,%rbp
    140e:	48 83 ec 30          	sub    $0x30,%rsp
    1412:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1416:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    141a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    141e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1422:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
    1426:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    142a:	48 c1 e0 20          	shl    $0x20,%rax
    142e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1432:	89 d2                	mov    %edx,%edx
    1434:	48 09 d0             	or     %rdx,%rax
    1437:	48 89 c6             	mov    %rax,%rsi
    143a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    143e:	48 ba 00 00 00 00 04 	movabs $0x400000000,%rdx
    1445:	00 00 00 
    1448:	48 09 d0             	or     %rdx,%rax
    144b:	48 89 c7             	mov    %rax,%rdi
    144e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    1452:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1456:	48 89 d1             	mov    %rdx,%rcx
    1459:	48 89 c2             	mov    %rax,%rdx
    145c:	e8 8e ec ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Sub_ID)|UVM_PARAM_D0(Func_ID),
                      Param1,
                      Param2);
}
    1461:	c9                   	leave
    1462:	c3                   	ret

0000000000001463 <UVM_Pgtbl_Crt>:
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Pgtbl, 
                    ptr_t Vaddr, ptr_t Start_Addr, ptr_t Top_Flag,
                    ptr_t Size_Order, ptr_t Num_Order)
{
    1463:	55                   	push   %rbp
    1464:	48 89 e5             	mov    %rsp,%rbp
    1467:	48 83 ec 30          	sub    $0x30,%rsp
    146b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    146f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1473:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1477:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    147b:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    147f:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
    1483:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1487:	48 0b 45 d0          	or     -0x30(%rbp),%rax
    148b:	48 89 c2             	mov    %rax,%rdx
    148e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1492:	48 c1 e0 20          	shl    $0x20,%rax
    1496:	48 89 c1             	mov    %rax,%rcx
    1499:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    149d:	48 c1 e0 10          	shl    $0x10,%rax
    14a1:	89 c0                	mov    %eax,%eax
    14a3:	48 09 c1             	or     %rax,%rcx
    14a6:	48 8b 45 10          	mov    0x10(%rbp),%rax
    14aa:	0f b7 c0             	movzwl %ax,%eax
    14ad:	48 89 ce             	mov    %rcx,%rsi
    14b0:	48 09 c6             	or     %rax,%rsi
    14b3:	48 8b 45 18          	mov    0x18(%rbp),%rax
    14b7:	48 c1 e0 30          	shl    $0x30,%rax
    14bb:	48 89 c1             	mov    %rax,%rcx
    14be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    14c2:	48 09 c1             	or     %rax,%rcx
    14c5:	48 b8 00 00 00 00 0f 	movabs $0xf00000000,%rax
    14cc:	00 00 00 
    14cf:	48 89 cf             	mov    %rcx,%rdi
    14d2:	48 09 c7             	or     %rax,%rdi
    14d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    14d9:	48 89 d1             	mov    %rdx,%rcx
    14dc:	48 89 c2             	mov    %rax,%rdx
    14df:	e8 0b ec ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_Q1(Cap_Pgtbl)|UVM_PARAM_Q0(Size_Order),
                      Vaddr, 
                      Start_Addr|Top_Flag);
}
    14e4:	c9                   	leave
    14e5:	c3                   	ret

00000000000014e6 <UVM_Pgtbl_Del>:
                                page table capability to be in. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Del(cid_t Cap_Captbl, cid_t Cap_Pgtbl)
{
    14e6:	55                   	push   %rbp
    14e7:	48 89 e5             	mov    %rsp,%rbp
    14ea:	48 83 ec 10          	sub    $0x10,%rsp
    14ee:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    14f2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DEL, Cap_Captbl,
    14f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14fa:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    14fe:	48 b9 00 00 00 00 10 	movabs $0x1000000000,%rcx
    1505:	00 00 00 
    1508:	48 09 ca             	or     %rcx,%rdx
    150b:	48 89 d7             	mov    %rdx,%rdi
    150e:	b9 00 00 00 00       	mov    $0x0,%ecx
    1513:	ba 00 00 00 00       	mov    $0x0,%edx
    1518:	48 89 c6             	mov    %rax,%rsi
    151b:	e8 cf eb ff ff       	call   ef <UVM_Svc>
                      Cap_Pgtbl,
                      0,
                      0);
}
    1520:	c9                   	leave
    1521:	c3                   	ret

0000000000001522 <UVM_Pgtbl_Add>:
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Add(cid_t Cap_Pgtbl_Dst, ptr_t Pos_Dst, ptr_t Flags_Dst,
                    cid_t Cap_Pgtbl_Src, ptr_t Pos_Src, ptr_t Index)
{
    1522:	55                   	push   %rbp
    1523:	48 89 e5             	mov    %rsp,%rbp
    1526:	48 83 ec 30          	sub    $0x30,%rsp
    152a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    152e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1532:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1536:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    153a:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    153e:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_ADD, 0,
    1542:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1546:	48 c1 e0 20          	shl    $0x20,%rax
    154a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    154e:	89 d2                	mov    %edx,%edx
    1550:	48 09 d0             	or     %rdx,%rax
    1553:	48 89 c1             	mov    %rax,%rcx
    1556:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    155a:	48 c1 e0 20          	shl    $0x20,%rax
    155e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    1562:	89 d2                	mov    %edx,%edx
    1564:	48 09 c2             	or     %rax,%rdx
    1567:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    156b:	48 c1 e0 20          	shl    $0x20,%rax
    156f:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    1573:	89 f6                	mov    %esi,%esi
    1575:	48 09 f0             	or     %rsi,%rax
    1578:	48 89 c6             	mov    %rax,%rsi
    157b:	48 b8 00 00 00 00 11 	movabs $0x1100000000,%rax
    1582:	00 00 00 
    1585:	48 89 c7             	mov    %rax,%rdi
    1588:	e8 62 eb ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Dst)|UVM_PARAM_D0(Pos_Dst),
                      UVM_PARAM_D1(Cap_Pgtbl_Src)|UVM_PARAM_D0(Pos_Src),
                      UVM_PARAM_D1(Flags_Dst)|UVM_PARAM_D0(Index));
}
    158d:	c9                   	leave
    158e:	c3                   	ret

000000000000158f <UVM_Pgtbl_Rem>:
              ptr_t Pos - The virtual address position to unmap from.
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Rem(cid_t Cap_Pgtbl, ptr_t Pos)
{
    158f:	55                   	push   %rbp
    1590:	48 89 e5             	mov    %rsp,%rbp
    1593:	48 83 ec 10          	sub    $0x10,%rsp
    1597:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    159b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_REM, 0,
    159f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15a3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    15a7:	b9 00 00 00 00       	mov    $0x0,%ecx
    15ac:	48 89 c6             	mov    %rax,%rsi
    15af:	48 b8 00 00 00 00 12 	movabs $0x1200000000,%rax
    15b6:	00 00 00 
    15b9:	48 89 c7             	mov    %rax,%rdi
    15bc:	e8 2e eb ff ff       	call   ef <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    15c1:	c9                   	leave
    15c2:	c3                   	ret

00000000000015c3 <UVM_Pgtbl_Con>:
              ptr_t Flags_Child - This have no effect on MPU-based architectures.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Con(cid_t Cap_Pgtbl_Parent, ptr_t Pos, cid_t Cap_Pgtbl_Child, ptr_t Flags_Child)
{
    15c3:	55                   	push   %rbp
    15c4:	48 89 e5             	mov    %rsp,%rbp
    15c7:	48 83 ec 20          	sub    $0x20,%rsp
    15cb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    15cf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    15d3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    15d7:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
    15db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15df:	48 c1 e0 20          	shl    $0x20,%rax
    15e3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    15e7:	89 d2                	mov    %edx,%edx
    15e9:	48 09 d0             	or     %rdx,%rax
    15ec:	48 89 c6             	mov    %rax,%rsi
    15ef:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    15f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    15f7:	48 89 d1             	mov    %rdx,%rcx
    15fa:	48 89 c2             	mov    %rax,%rdx
    15fd:	48 b8 00 00 00 00 13 	movabs $0x1300000000,%rax
    1604:	00 00 00 
    1607:	48 89 c7             	mov    %rax,%rdi
    160a:	e8 e0 ea ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Parent)|UVM_PARAM_D0(Cap_Pgtbl_Child),
                      Pos,
                      Flags_Child);
}
    160f:	c9                   	leave
    1610:	c3                   	ret

0000000000001611 <UVM_Pgtbl_Des>:
                          table from.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Des(cid_t Cap_Pgtbl, ptr_t Pos)
{
    1611:	55                   	push   %rbp
    1612:	48 89 e5             	mov    %rsp,%rbp
    1615:	48 83 ec 10          	sub    $0x10,%rsp
    1619:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    161d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DES, 0,
    1621:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1625:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1629:	b9 00 00 00 00       	mov    $0x0,%ecx
    162e:	48 89 c6             	mov    %rax,%rsi
    1631:	48 b8 00 00 00 00 14 	movabs $0x1400000000,%rax
    1638:	00 00 00 
    163b:	48 89 c7             	mov    %rax,%rdi
    163e:	e8 ac ea ff ff       	call   ef <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    1643:	c9                   	leave
    1644:	c3                   	ret

0000000000001645 <UVM_Proc_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, cid_t Cap_Proc,
                   cid_t Cap_Captbl, cid_t Cap_Pgtbl, ptr_t Vaddr)
{
    1645:	55                   	push   %rbp
    1646:	48 89 e5             	mov    %rsp,%rbp
    1649:	48 83 ec 30          	sub    $0x30,%rsp
    164d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1651:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1655:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1659:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    165d:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    1661:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
    1665:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1669:	48 c1 e0 20          	shl    $0x20,%rax
    166d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    1671:	89 d2                	mov    %edx,%edx
    1673:	48 09 c2             	or     %rax,%rdx
    1676:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    167a:	48 c1 e0 20          	shl    $0x20,%rax
    167e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1682:	89 c9                	mov    %ecx,%ecx
    1684:	48 09 c8             	or     %rcx,%rax
    1687:	48 89 c6             	mov    %rax,%rsi
    168a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    168e:	48 b9 00 00 00 00 15 	movabs $0x1500000000,%rcx
    1695:	00 00 00 
    1698:	48 09 c8             	or     %rcx,%rax
    169b:	48 89 c7             	mov    %rax,%rdi
    169e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    16a2:	48 89 c1             	mov    %rax,%rcx
    16a5:	e8 45 ea ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Proc),
                      UVM_PARAM_D1(Cap_Captbl)|UVM_PARAM_D0(Cap_Pgtbl),
                      Vaddr);
}
    16aa:	c9                   	leave
    16ab:	c3                   	ret

00000000000016ac <UVM_Proc_Del>:
              cid_t Cap_Proc - The capability to the process. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Del(cid_t Cap_Captbl, cid_t Cap_Proc)
{
    16ac:	55                   	push   %rbp
    16ad:	48 89 e5             	mov    %rsp,%rbp
    16b0:	48 83 ec 10          	sub    $0x10,%rsp
    16b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    16b8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_DEL, Cap_Captbl,
    16bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    16c0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    16c4:	48 b9 00 00 00 00 16 	movabs $0x1600000000,%rcx
    16cb:	00 00 00 
    16ce:	48 09 ca             	or     %rcx,%rdx
    16d1:	48 89 d7             	mov    %rdx,%rdi
    16d4:	b9 00 00 00 00       	mov    $0x0,%ecx
    16d9:	ba 00 00 00 00       	mov    $0x0,%edx
    16de:	48 89 c6             	mov    %rax,%rsi
    16e1:	e8 09 ea ff ff       	call   ef <UVM_Svc>
                      Cap_Proc,
                      0,
                      0);
}
    16e6:	c9                   	leave
    16e7:	c3                   	ret

00000000000016e8 <UVM_Proc_Cpt>:
                                 this process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Cpt(cid_t Cap_Proc, cid_t Cap_Captbl)
{
    16e8:	55                   	push   %rbp
    16e9:	48 89 e5             	mov    %rsp,%rbp
    16ec:	48 83 ec 10          	sub    $0x10,%rsp
    16f0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    16f4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CPT, 0,
    16f8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    16fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1700:	b9 00 00 00 00       	mov    $0x0,%ecx
    1705:	48 89 c6             	mov    %rax,%rsi
    1708:	48 b8 00 00 00 00 17 	movabs $0x1700000000,%rax
    170f:	00 00 00 
    1712:	48 89 c7             	mov    %rax,%rdi
    1715:	e8 d5 e9 ff ff       	call   ef <UVM_Svc>
                      Cap_Proc,
                      Cap_Captbl,
                      0);
}
    171a:	c9                   	leave
    171b:	c3                   	ret

000000000000171c <UVM_Proc_Pgt>:
                                process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Pgt(cid_t Cap_Proc, cid_t Cap_Pgtbl)
{
    171c:	55                   	push   %rbp
    171d:	48 89 e5             	mov    %rsp,%rbp
    1720:	48 83 ec 10          	sub    $0x10,%rsp
    1724:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1728:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_PGT, 0,
    172c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1730:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1734:	b9 00 00 00 00       	mov    $0x0,%ecx
    1739:	48 89 c6             	mov    %rax,%rsi
    173c:	48 b8 00 00 00 00 18 	movabs $0x1800000000,%rax
    1743:	00 00 00 
    1746:	48 89 c7             	mov    %rax,%rdi
    1749:	e8 a1 e9 ff ff       	call   ef <UVM_Svc>
                      Cap_Proc,
                      Cap_Pgtbl,
                      0);
}
    174e:	c9                   	leave
    174f:	c3                   	ret

0000000000001750 <UVM_Thd_Crt>:
Output      : None.
Return      : ret_t - If successful, the Thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Thd,
                  cid_t Cap_Proc, ptr_t Max_Prio, ptr_t Vaddr)
{
    1750:	55                   	push   %rbp
    1751:	48 89 e5             	mov    %rsp,%rbp
    1754:	48 83 ec 30          	sub    $0x30,%rsp
    1758:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    175c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1760:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1764:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1768:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    176c:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
    1770:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1774:	48 c1 e0 20          	shl    $0x20,%rax
    1778:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    177c:	89 d2                	mov    %edx,%edx
    177e:	48 09 c2             	or     %rax,%rdx
    1781:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1785:	48 c1 e0 20          	shl    $0x20,%rax
    1789:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    178d:	89 c9                	mov    %ecx,%ecx
    178f:	48 09 c8             	or     %rcx,%rax
    1792:	48 89 c6             	mov    %rax,%rsi
    1795:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1799:	48 b9 00 00 00 00 19 	movabs $0x1900000000,%rcx
    17a0:	00 00 00 
    17a3:	48 09 c8             	or     %rcx,%rax
    17a6:	48 89 c7             	mov    %rax,%rdi
    17a9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    17ad:	48 89 c1             	mov    %rax,%rcx
    17b0:	e8 3a e9 ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Thd),
                      UVM_PARAM_D1(Cap_Proc)|UVM_PARAM_D0(Max_Prio),
                      Vaddr);
}
    17b5:	c9                   	leave
    17b6:	c3                   	ret

00000000000017b7 <UVM_Thd_Del>:
              cid_t Cap_Thd - The capability to the thread in the captbl. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Del(cid_t Cap_Captbl, cid_t Cap_Thd)
{
    17b7:	55                   	push   %rbp
    17b8:	48 89 e5             	mov    %rsp,%rbp
    17bb:	48 83 ec 10          	sub    $0x10,%rsp
    17bf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    17c3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_DEL, Cap_Captbl,
    17c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    17cb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    17cf:	48 b9 00 00 00 00 1a 	movabs $0x1a00000000,%rcx
    17d6:	00 00 00 
    17d9:	48 09 ca             	or     %rcx,%rdx
    17dc:	48 89 d7             	mov    %rdx,%rdi
    17df:	b9 00 00 00 00       	mov    $0x0,%ecx
    17e4:	ba 00 00 00 00       	mov    $0x0,%edx
    17e9:	48 89 c6             	mov    %rax,%rsi
    17ec:	e8 fe e8 ff ff       	call   ef <UVM_Svc>
                      Cap_Thd,
                      0,
                      0);
}
    17f1:	c9                   	leave
    17f2:	c3                   	ret

00000000000017f3 <UVM_Thd_Exec_Set>:
              ptr_t Param - The parameter of the thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Exec_Set(cid_t Cap_Thd, ptr_t Entry, ptr_t Stack, ptr_t Param)
{
    17f3:	55                   	push   %rbp
    17f4:	48 89 e5             	mov    %rsp,%rbp
    17f7:	48 83 ec 20          	sub    $0x20,%rsp
    17fb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    17ff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1803:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1807:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, Cap_Thd,
    180b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    180f:	48 ba 00 00 00 00 06 	movabs $0x600000000,%rdx
    1816:	00 00 00 
    1819:	48 09 d0             	or     %rdx,%rax
    181c:	48 89 c7             	mov    %rax,%rdi
    181f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    1823:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1827:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    182b:	48 89 c6             	mov    %rax,%rsi
    182e:	e8 bc e8 ff ff       	call   ef <UVM_Svc>
                      Entry, 
                      Stack,
                      Param);
}
    1833:	c9                   	leave
    1834:	c3                   	ret

0000000000001835 <UVM_Thd_Hyp_Set>:
                            thread's register sets.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Hyp_Set(cid_t Cap_Thd, ptr_t Kaddr)
{
    1835:	55                   	push   %rbp
    1836:	48 89 e5             	mov    %rsp,%rbp
    1839:	48 83 ec 10          	sub    $0x10,%rsp
    183d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1841:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, 0,
    1845:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1849:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    184d:	b9 00 00 00 00       	mov    $0x0,%ecx
    1852:	48 89 c6             	mov    %rax,%rsi
    1855:	48 b8 00 00 00 00 06 	movabs $0x600000000,%rax
    185c:	00 00 00 
    185f:	48 89 c7             	mov    %rax,%rdi
    1862:	e8 88 e8 ff ff       	call   ef <UVM_Svc>
                      Cap_Thd,
                      Kaddr,
                      0);
}
    1867:	c9                   	leave
    1868:	c3                   	ret

0000000000001869 <UVM_Thd_Sched_Bind>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Bind(cid_t Cap_Thd, cid_t Cap_Thd_Sched, cid_t Cap_Sig, tid_t TID, ptr_t Prio)
{
    1869:	55                   	push   %rbp
    186a:	48 89 e5             	mov    %rsp,%rbp
    186d:	48 83 ec 30          	sub    $0x30,%rsp
    1871:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1875:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1879:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    187d:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1881:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    1885:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1889:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    188d:	48 c1 e2 20          	shl    $0x20,%rdx
    1891:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1895:	89 c9                	mov    %ecx,%ecx
    1897:	48 89 d6             	mov    %rdx,%rsi
    189a:	48 09 ce             	or     %rcx,%rsi
    189d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    18a1:	48 b9 00 00 00 00 1b 	movabs $0x1b00000000,%rcx
    18a8:	00 00 00 
    18ab:	48 89 d7             	mov    %rdx,%rdi
    18ae:	48 09 cf             	or     %rcx,%rdi
    18b1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    18b5:	48 89 d1             	mov    %rdx,%rcx
    18b8:	48 89 c2             	mov    %rax,%rdx
    18bb:	e8 2f e8 ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Cap_Thd_Sched)|UVM_PARAM_D0(Cap_Sig),
                      TID, 
                      Prio);
}
    18c0:	c9                   	leave
    18c1:	c3                   	ret

00000000000018c2 <UVM_Thd_Sched_Rcv>:
                              is simply not allowed. 2-Level.
Output      : None.
Return      : ret_t - If successful, the thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Rcv(cid_t Cap_Thd)
{
    18c2:	55                   	push   %rbp
    18c3:	48 89 e5             	mov    %rsp,%rbp
    18c6:	48 83 ec 10          	sub    $0x10,%rsp
    18ca:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_RCV, 0,
    18ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    18d2:	b9 00 00 00 00       	mov    $0x0,%ecx
    18d7:	ba 00 00 00 00       	mov    $0x0,%edx
    18dc:	48 89 c6             	mov    %rax,%rsi
    18df:	48 b8 00 00 00 00 1c 	movabs $0x1c00000000,%rax
    18e6:	00 00 00 
    18e9:	48 89 c7             	mov    %rax,%rdi
    18ec:	e8 fe e7 ff ff       	call   ef <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    18f1:	c9                   	leave
    18f2:	c3                   	ret

00000000000018f3 <UVM_Thd_Sched_Prio>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Prio(cid_t Cap_Thd, ptr_t Prio)
{
    18f3:	55                   	push   %rbp
    18f4:	48 89 e5             	mov    %rsp,%rbp
    18f7:	48 83 ec 10          	sub    $0x10,%rsp
    18fb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    18ff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_PRIO, 0,
    1903:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1907:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    190b:	b9 00 00 00 00       	mov    $0x0,%ecx
    1910:	48 89 c6             	mov    %rax,%rsi
    1913:	48 b8 00 00 00 00 07 	movabs $0x700000000,%rax
    191a:	00 00 00 
    191d:	48 89 c7             	mov    %rax,%rdi
    1920:	e8 ca e7 ff ff       	call   ef <UVM_Svc>
                      Cap_Thd,
                      Prio, 
                      0);
}
    1925:	c9                   	leave
    1926:	c3                   	ret

0000000000001927 <UVM_Thd_Sched_Free>:
Input       : cid_t Cap_Thd - The capability to the thread. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Free(cid_t Cap_Thd)
{
    1927:	55                   	push   %rbp
    1928:	48 89 e5             	mov    %rsp,%rbp
    192b:	48 83 ec 10          	sub    $0x10,%rsp
    192f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_FREE, 0,
    1933:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1937:	b9 00 00 00 00       	mov    $0x0,%ecx
    193c:	ba 00 00 00 00       	mov    $0x0,%edx
    1941:	48 89 c6             	mov    %rax,%rsi
    1944:	48 b8 00 00 00 00 05 	movabs $0x500000000,%rax
    194b:	00 00 00 
    194e:	48 89 c7             	mov    %rax,%rdi
    1951:	e8 99 e7 ff ff       	call   ef <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    1956:	c9                   	leave
    1957:	c3                   	ret

0000000000001958 <UVM_Thd_Time_Xfer>:
                           order of 100us or 1ms.
Output      : None.
Return      : ret_t - If successful, the destination time amount; or an error code.
******************************************************************************/
ret_t UVM_Thd_Time_Xfer(cid_t Cap_Thd_Dst, cid_t Cap_Thd_Src, ptr_t Time)
{
    1958:	55                   	push   %rbp
    1959:	48 89 e5             	mov    %rsp,%rbp
    195c:	48 83 ec 20          	sub    $0x20,%rsp
    1960:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1964:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1968:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_TIME_XFER, 0,
    196c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1970:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1974:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1978:	48 89 c6             	mov    %rax,%rsi
    197b:	48 b8 00 00 00 00 08 	movabs $0x800000000,%rax
    1982:	00 00 00 
    1985:	48 89 c7             	mov    %rax,%rdi
    1988:	e8 62 e7 ff ff       	call   ef <UVM_Svc>
                      Cap_Thd_Dst,
                      Cap_Thd_Src, 
                      Time);
}
    198d:	c9                   	leave
    198e:	c3                   	ret

000000000000198f <UVM_Thd_Swt>:
                                 this thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Swt(cid_t Cap_Thd, ptr_t Full_Yield)
{
    198f:	55                   	push   %rbp
    1990:	48 89 e5             	mov    %rsp,%rbp
    1993:	48 83 ec 10          	sub    $0x10,%rsp
    1997:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    199b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SWT, 0,
    199f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    19a3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    19a7:	b9 00 00 00 00       	mov    $0x0,%ecx
    19ac:	48 89 c6             	mov    %rax,%rsi
    19af:	48 b8 00 00 00 00 09 	movabs $0x900000000,%rax
    19b6:	00 00 00 
    19b9:	48 89 c7             	mov    %rax,%rdi
    19bc:	e8 2e e7 ff ff       	call   ef <UVM_Svc>
                      Cap_Thd,
                      Full_Yield, 
                      0);
}
    19c1:	c9                   	leave
    19c2:	c3                   	ret

00000000000019c3 <UVM_Sig_Crt>:
                            within the kernel virtual address.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Sig, ptr_t Vaddr)
{
    19c3:	55                   	push   %rbp
    19c4:	48 89 e5             	mov    %rsp,%rbp
    19c7:	48 83 ec 20          	sub    $0x20,%rsp
    19cb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    19cf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    19d3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    19d7:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
    19db:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    19df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    19e3:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    19e7:	48 be 00 00 00 00 1d 	movabs $0x1d00000000,%rsi
    19ee:	00 00 00 
    19f1:	48 89 cf             	mov    %rcx,%rdi
    19f4:	48 09 f7             	or     %rsi,%rdi
    19f7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    19fb:	48 89 c6             	mov    %rax,%rsi
    19fe:	e8 ec e6 ff ff       	call   ef <UVM_Svc>
                      Cap_Kmem,
                      Cap_Sig, 
                      Vaddr);
}
    1a03:	c9                   	leave
    1a04:	c3                   	ret

0000000000001a05 <UVM_Sig_Del>:
              cid_t Cap_Sig - The capability to the signal. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Del(cid_t Cap_Captbl, cid_t Cap_Sig)
{
    1a05:	55                   	push   %rbp
    1a06:	48 89 e5             	mov    %rsp,%rbp
    1a09:	48 83 ec 10          	sub    $0x10,%rsp
    1a0d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1a11:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_DEL, Cap_Captbl,
    1a15:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1a19:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1a1d:	48 b9 00 00 00 00 1e 	movabs $0x1e00000000,%rcx
    1a24:	00 00 00 
    1a27:	48 09 ca             	or     %rcx,%rdx
    1a2a:	48 89 d7             	mov    %rdx,%rdi
    1a2d:	b9 00 00 00 00       	mov    $0x0,%ecx
    1a32:	ba 00 00 00 00       	mov    $0x0,%edx
    1a37:	48 89 c6             	mov    %rax,%rsi
    1a3a:	e8 b0 e6 ff ff       	call   ef <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    1a3f:	c9                   	leave
    1a40:	c3                   	ret

0000000000001a41 <UVM_Sig_Snd>:
Input       : cid_t Cap_Sig - The capability to the signal. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0, or an error code.
******************************************************************************/
ret_t UVM_Sig_Snd(cid_t Cap_Sig)
{
    1a41:	55                   	push   %rbp
    1a42:	48 89 e5             	mov    %rsp,%rbp
    1a45:	48 83 ec 10          	sub    $0x10,%rsp
    1a49:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_SND, 0,
    1a4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a51:	b9 00 00 00 00       	mov    $0x0,%ecx
    1a56:	ba 00 00 00 00       	mov    $0x0,%edx
    1a5b:	48 89 c6             	mov    %rax,%rsi
    1a5e:	48 b8 00 00 00 00 02 	movabs $0x200000000,%rax
    1a65:	00 00 00 
    1a68:	48 89 c7             	mov    %rax,%rdi
    1a6b:	e8 7f e6 ff ff       	call   ef <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    1a70:	c9                   	leave
    1a71:	c3                   	ret

0000000000001a72 <UVM_Sig_Rcv>:
Output      : None.
Return      : ret_t - If successful, a non-negative number containing the number of signals
                      received will be returned; else an error code.
******************************************************************************/
ret_t UVM_Sig_Rcv(cid_t Cap_Sig, ptr_t Option)
{
    1a72:	55                   	push   %rbp
    1a73:	48 89 e5             	mov    %rsp,%rbp
    1a76:	48 83 ec 10          	sub    $0x10,%rsp
    1a7a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1a7e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_RCV, 0,
    1a82:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a86:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1a8a:	b9 00 00 00 00       	mov    $0x0,%ecx
    1a8f:	48 89 c6             	mov    %rax,%rsi
    1a92:	48 b8 00 00 00 00 03 	movabs $0x300000000,%rax
    1a99:	00 00 00 
    1a9c:	48 89 c7             	mov    %rax,%rdi
    1a9f:	e8 4b e6 ff ff       	call   ef <UVM_Svc>
                      Cap_Sig,
                      Option, 
                      0);
}
    1aa4:	c9                   	leave
    1aa5:	c3                   	ret

0000000000001aa6 <UVM_Inv_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, 
                  cid_t Cap_Inv, cid_t Cap_Proc, ptr_t Vaddr)
{
    1aa6:	55                   	push   %rbp
    1aa7:	48 89 e5             	mov    %rsp,%rbp
    1aaa:	48 83 ec 30          	sub    $0x30,%rsp
    1aae:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1ab2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1ab6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1aba:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1abe:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    1ac2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1ac6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1aca:	48 c1 e2 20          	shl    $0x20,%rdx
    1ace:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1ad2:	89 c9                	mov    %ecx,%ecx
    1ad4:	48 89 d6             	mov    %rdx,%rsi
    1ad7:	48 09 ce             	or     %rcx,%rsi
    1ada:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1ade:	48 b9 00 00 00 00 1f 	movabs $0x1f00000000,%rcx
    1ae5:	00 00 00 
    1ae8:	48 89 d7             	mov    %rdx,%rdi
    1aeb:	48 09 cf             	or     %rcx,%rdi
    1aee:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    1af2:	48 89 d1             	mov    %rdx,%rcx
    1af5:	48 89 c2             	mov    %rax,%rdx
    1af8:	e8 f2 e5 ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Inv),
                      Cap_Proc, 
                      Vaddr);
}
    1afd:	c9                   	leave
    1afe:	c3                   	ret

0000000000001aff <UVM_Inv_Del>:
              cid_t Cap_Inv - The capability to the invocation stub. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Del(cid_t Cap_Captbl, cid_t Cap_Inv)
{
    1aff:	55                   	push   %rbp
    1b00:	48 89 e5             	mov    %rsp,%rbp
    1b03:	48 83 ec 10          	sub    $0x10,%rsp
    1b07:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1b0b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_DEL, Cap_Captbl,
    1b0f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1b13:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1b17:	48 b9 00 00 00 00 20 	movabs $0x2000000000,%rcx
    1b1e:	00 00 00 
    1b21:	48 09 ca             	or     %rcx,%rdx
    1b24:	48 89 d7             	mov    %rdx,%rdi
    1b27:	b9 00 00 00 00       	mov    $0x0,%ecx
    1b2c:	ba 00 00 00 00       	mov    $0x0,%edx
    1b31:	48 89 c6             	mov    %rax,%rsi
    1b34:	e8 b6 e5 ff ff       	call   ef <UVM_Svc>
                      Cap_Inv,
                      0, 
                      0);
}
    1b39:	c9                   	leave
    1b3a:	c3                   	ret

0000000000001b3b <UVM_Inv_Set>:
                                     immediately, or we wait for fault handling?
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Set(cid_t Cap_Inv, ptr_t Entry, ptr_t Stack, ptr_t Fault_Ret_Flag)
{
    1b3b:	55                   	push   %rbp
    1b3c:	48 89 e5             	mov    %rsp,%rbp
    1b3f:	48 83 ec 20          	sub    $0x20,%rsp
    1b43:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1b47:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1b4b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1b4f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
    1b53:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1b57:	48 c1 e0 20          	shl    $0x20,%rax
    1b5b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1b5f:	89 d2                	mov    %edx,%edx
    1b61:	48 09 d0             	or     %rdx,%rax
    1b64:	48 89 c6             	mov    %rax,%rsi
    1b67:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1b6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1b6f:	48 89 d1             	mov    %rdx,%rcx
    1b72:	48 89 c2             	mov    %rax,%rdx
    1b75:	48 b8 00 00 00 00 21 	movabs $0x2100000000,%rax
    1b7c:	00 00 00 
    1b7f:	48 89 c7             	mov    %rax,%rdi
    1b82:	e8 68 e5 ff ff       	call   ef <UVM_Svc>
                      UVM_PARAM_D1(Fault_Ret_Flag)|UVM_PARAM_D0(Cap_Inv),
                      Entry, 
                      Stack);
}
    1b87:	c9                   	leave
    1b88:	c3                   	ret

0000000000001b89 <UVM_Putchar>:
Input       : char Char - The character to print.
Output      : None.
Return      : ptr_t - Always 0.
******************************************************************************/
ptr_t UVM_Putchar(char Char)
{
    1b89:	55                   	push   %rbp
    1b8a:	48 89 e5             	mov    %rsp,%rbp
    1b8d:	48 83 ec 10          	sub    $0x10,%rsp
    1b91:	89 f8                	mov    %edi,%eax
    1b93:	88 45 fc             	mov    %al,-0x4(%rbp)
    /* Wait until we have transmitted */
    while((__UVM_X64_In(UVM_X64_COM1+5)&0x20)==0);
    1b96:	90                   	nop
    1b97:	bf fd 03 00 00       	mov    $0x3fd,%edi
    1b9c:	e8 66 e4 ff ff       	call   7 <__UVM_X64_In>
    1ba1:	83 e0 20             	and    $0x20,%eax
    1ba4:	48 85 c0             	test   %rax,%rax
    1ba7:	74 ee                	je     1b97 <UVM_Putchar+0xe>

    __UVM_X64_Out(UVM_X64_COM1, Char);
    1ba9:	48 0f be 45 fc       	movsbq -0x4(%rbp),%rax
    1bae:	48 89 c6             	mov    %rax,%rsi
    1bb1:	bf f8 03 00 00       	mov    $0x3f8,%edi
    1bb6:	e8 56 e4 ff ff       	call   11 <__UVM_X64_Out>

    return 0;
    1bbb:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1bc0:	c9                   	leave
    1bc1:	c3                   	ret

0000000000001bc2 <_UVM_Stack_Init>:
Output      : None.
Return      : ptr_t - The actual stack address to use for system call.
******************************************************************************/
ptr_t _UVM_Stack_Init(ptr_t Stack, ptr_t Size, ptr_t Stub, ptr_t Entry,
                      ptr_t Param1, ptr_t Param2, ptr_t Param3, ptr_t Param4)
{
    1bc2:	55                   	push   %rbp
    1bc3:	48 89 e5             	mov    %rsp,%rbp
    1bc6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1bca:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    1bce:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    1bd2:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    1bd6:	4c 89 45 c8          	mov    %r8,-0x38(%rbp)
    1bda:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
	ptr_t* Stack_Ptr;

    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    1bde:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1be2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1be6:	48 01 d0             	add    %rdx,%rax
    1be9:	48 2d 00 01 00 00    	sub    $0x100,%rax
    1bef:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    Stack_Ptr[0]=Param1;
    1bf3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1bf7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    1bfb:	48 89 10             	mov    %rdx,(%rax)
    Stack_Ptr[1]=Param2;
    1bfe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1c02:	48 8d 50 08          	lea    0x8(%rax),%rdx
    1c06:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1c0a:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[2]=Param3;
    1c0d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1c11:	48 8d 50 10          	lea    0x10(%rax),%rdx
    1c15:	48 8b 45 10          	mov    0x10(%rbp),%rax
    1c19:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[3]=Param4;
    1c1c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1c20:	48 8d 50 18          	lea    0x18(%rax),%rdx
    1c24:	48 8b 45 18          	mov    0x18(%rbp),%rax
    1c28:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[4]=Entry;
    1c2b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1c2f:	48 8d 50 20          	lea    0x20(%rax),%rdx
    1c33:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1c37:	48 89 02             	mov    %rax,(%rdx)

    return (ptr_t)Stack_Ptr;
    1c3a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    1c3e:	5d                   	pop    %rbp
    1c3f:	c3                   	ret

0000000000001c40 <_UVM_Idle>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void _UVM_Idle(void)
{
    1c40:	55                   	push   %rbp
    1c41:	48 89 e5             	mov    %rsp,%rbp
    /* Do nothing. In the future we may call a kernel function to put us to sleep */
}
    1c44:	90                   	nop
    1c45:	5d                   	pop    %rbp
    1c46:	c3                   	ret


./Object/UVM：     文件格式 elf64-x86-64


Disassembly of section .text:

0000000000000000 <_UVM_Entry>:
              space very well.
Input       : None.
Output      : None.
*****************************************************************************/
_UVM_Entry:
    JMP                 main
       0:	e9 ab 02 00 00       	jmp    2b0 <main>

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

000000000000017e <test>:
ptr_t sum;
ptr_t sumin;
ptr_t sumout;

void test(void)
{
     17e:	f3 0f 1e fa          	endbr64
     182:	55                   	push   %rbp
     183:	48 89 e5             	mov    %rsp,%rbp
     186:	48 83 ec 10          	sub    $0x10,%rsp
    cnt_t Count;
    sum=0;
     18a:	48 c7 05 8b 1e 00 00 	movq   $0x0,0x1e8b(%rip)        # 2020 <sum>
     191:	00 00 00 00 

    for(Count=0;Count<1000000;Count++)
     195:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     19c:	00 
     19d:	eb 4e                	jmp    1ed <test+0x6f>
    {
        start=__UVM_X64_Read_TSC();
     19f:	e8 77 fe ff ff       	call   1b <__UVM_X64_Read_TSC>
     1a4:	48 89 05 5d 1e 00 00 	mov    %rax,0x1e5d(%rip)        # 2008 <start>
        UVM_Thd_Swt(TEST_THD2,0);
     1ab:	be 00 00 00 00       	mov    $0x0,%esi
     1b0:	bf 0a 00 00 00       	mov    $0xa,%edi
     1b5:	e8 7f 18 00 00       	call   1a39 <UVM_Thd_Swt>
        end=__UVM_X64_Read_TSC();
     1ba:	e8 5c fe ff ff       	call   1b <__UVM_X64_Read_TSC>
     1bf:	48 89 05 52 1e 00 00 	mov    %rax,0x1e52(%rip)        # 2018 <end>
        sum+=end-start;
     1c6:	48 8b 15 4b 1e 00 00 	mov    0x1e4b(%rip),%rdx        # 2018 <end>
     1cd:	48 8b 05 34 1e 00 00 	mov    0x1e34(%rip),%rax        # 2008 <start>
     1d4:	48 29 c2             	sub    %rax,%rdx
     1d7:	48 8b 05 42 1e 00 00 	mov    0x1e42(%rip),%rax        # 2020 <sum>
     1de:	48 01 d0             	add    %rdx,%rax
     1e1:	48 89 05 38 1e 00 00 	mov    %rax,0x1e38(%rip)        # 2020 <sum>
    for(Count=0;Count<1000000;Count++)
     1e8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     1ed:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
     1f4:	00 
     1f5:	7e a8                	jle    19f <test+0x21>
    }

    UVM_LOG_S("\r\nswtch ");
     1f7:	bf 28 1d 00 00       	mov    $0x1d28,%edi
     1fc:	e8 08 0f 00 00       	call   1109 <UVM_Print_String>
    UVM_LOG_I(sum/1000000);
     201:	48 8b 05 18 1e 00 00 	mov    0x1e18(%rip),%rax        # 2020 <sum>
     208:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     20f:	de 1b 43 
     212:	48 f7 e2             	mul    %rdx
     215:	48 89 d0             	mov    %rdx,%rax
     218:	48 c1 e8 12          	shr    $0x12,%rax
     21c:	48 89 c7             	mov    %rax,%rdi
     21f:	e8 1b 0c 00 00       	call   e3f <UVM_Print_Int>
    UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*8, sum/1000000, 0);
     224:	48 8b 05 f5 1d 00 00 	mov    0x1df5(%rip),%rax        # 2020 <sum>
     22b:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     232:	de 1b 43 
     235:	48 f7 e2             	mul    %rdx
     238:	48 89 d0             	mov    %rdx,%rax
     23b:	48 c1 e8 12          	shr    $0x12,%rax
     23f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     245:	48 89 c1             	mov    %rax,%rcx
     248:	ba 00 05 00 00       	mov    $0x500,%edx
     24d:	be 07 00 00 00       	mov    $0x7,%esi
     252:	bf 04 00 00 00       	mov    $0x4,%edi
     257:	e8 08 12 00 00       	call   1464 <UVM_Kern_Act>
    while(1);
     25c:	90                   	nop
     25d:	eb fd                	jmp    25c <test+0xde>

000000000000025f <test2>:
}

void test2(void)
{
     25f:	f3 0f 1e fa          	endbr64
     263:	55                   	push   %rbp
     264:	48 89 e5             	mov    %rsp,%rbp
    while(1)
    {
        UVM_Thd_Swt(TEST_THD1,0);
     267:	be 00 00 00 00       	mov    $0x0,%esi
     26c:	bf 09 00 00 00       	mov    $0x9,%edi
     271:	e8 c3 17 00 00       	call   1a39 <UVM_Thd_Swt>
     276:	eb ef                	jmp    267 <test2+0x8>

0000000000000278 <sinvtest>:
    }
}

void sinvtest(ptr_t Param)
{
     278:	f3 0f 1e fa          	endbr64
     27c:	55                   	push   %rbp
     27d:	48 89 e5             	mov    %rsp,%rbp
     280:	48 83 ec 10          	sub    $0x10,%rsp
     284:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    middle=__UVM_X64_Read_TSC();
     288:	e8 8e fd ff ff       	call   1b <__UVM_X64_Read_TSC>
     28d:	48 89 05 7c 1d 00 00 	mov    %rax,0x1d7c(%rip)        # 2010 <middle>
    UVM_Svc(0,0,0,0);
     294:	b9 00 00 00 00       	mov    $0x0,%ecx
     299:	ba 00 00 00 00       	mov    $0x0,%edx
     29e:	be 00 00 00 00       	mov    $0x0,%esi
     2a3:	bf 00 00 00 00       	mov    $0x0,%edi
     2a8:	e8 40 fe ff ff       	call   ed <UVM_Svc>
}
     2ad:	90                   	nop
     2ae:	c9                   	leave
     2af:	c3                   	ret

00000000000002b0 <main>:
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(ptr_t CPUID)
{
     2b0:	f3 0f 1e fa          	endbr64
     2b4:	55                   	push   %rbp
     2b5:	48 89 e5             	mov    %rsp,%rbp
     2b8:	48 83 ec 20          	sub    $0x20,%rsp
     2bc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)

    ptr_t Cur_Addr;
    cnt_t Count;

    UVM_LOG_I(CPUID);
     2c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     2c4:	48 89 c7             	mov    %rax,%rdi
     2c7:	e8 73 0b 00 00       	call   e3f <UVM_Print_Int>
    /* We only print information on the first CPU */
    if(CPUID==0)
     2cc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
     2d1:	0f 85 c4 0a 00 00    	jne    d9b <main+0xaeb>
    {
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0, 1234, 0);
     2d7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     2dd:	b9 d2 04 00 00       	mov    $0x4d2,%ecx
     2e2:	ba 00 00 00 00       	mov    $0x0,%edx
     2e7:	be 07 00 00 00       	mov    $0x7,%esi
     2ec:	bf 04 00 00 00       	mov    $0x4,%edi
     2f1:	e8 6e 11 00 00       	call   1464 <UVM_Kern_Act>
        UVM_LOG_S("\r\n");
        UVM_LOG_S("                  Application Processor User-level Platform!\r\n");
        UVM_LOG_S("-------------------------------------------------------------------------------\r\n");
    UVM_LOG_U(__UVM_X64_Read_TSC());
    UVM_LOG_U(__UVM_X64_Read_TSC());*/
        sum=0;
     2f6:	48 c7 05 1f 1d 00 00 	movq   $0x0,0x1d1f(%rip)        # 2020 <sum>
     2fd:	00 00 00 00 

        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
     301:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     308:	00 
     309:	eb 3f                	jmp    34a <main+0x9a>
        {
            start=__UVM_X64_Read_TSC();
     30b:	e8 0b fd ff ff       	call   1b <__UVM_X64_Read_TSC>
     310:	48 89 05 f1 1c 00 00 	mov    %rax,0x1cf1(%rip)        # 2008 <start>
            end=__UVM_X64_Read_TSC();
     317:	e8 ff fc ff ff       	call   1b <__UVM_X64_Read_TSC>
     31c:	48 89 05 f5 1c 00 00 	mov    %rax,0x1cf5(%rip)        # 2018 <end>
            sum+=end-start;
     323:	48 8b 15 ee 1c 00 00 	mov    0x1cee(%rip),%rdx        # 2018 <end>
     32a:	48 8b 05 d7 1c 00 00 	mov    0x1cd7(%rip),%rax        # 2008 <start>
     331:	48 29 c2             	sub    %rax,%rdx
     334:	48 8b 05 e5 1c 00 00 	mov    0x1ce5(%rip),%rax        # 2020 <sum>
     33b:	48 01 d0             	add    %rdx,%rax
     33e:	48 89 05 db 1c 00 00 	mov    %rax,0x1cdb(%rip)        # 2020 <sum>
        for(Count=0;Count<1000000;Count++)
     345:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     34a:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
     351:	00 
     352:	7e b7                	jle    30b <main+0x5b>
        }
        UVM_LOG_S("\r\nempty");
     354:	bf 31 1d 00 00       	mov    $0x1d31,%edi
     359:	e8 ab 0d 00 00       	call   1109 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
     35e:	48 8b 05 bb 1c 00 00 	mov    0x1cbb(%rip),%rax        # 2020 <sum>
     365:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     36c:	de 1b 43 
     36f:	48 f7 e2             	mul    %rdx
     372:	48 89 d0             	mov    %rdx,%rax
     375:	48 c1 e8 12          	shr    $0x12,%rax
     379:	48 89 c7             	mov    %rax,%rdi
     37c:	e8 be 0a 00 00       	call   e3f <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0, sum/1000000, 0);
     381:	48 8b 05 98 1c 00 00 	mov    0x1c98(%rip),%rax        # 2020 <sum>
     388:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     38f:	de 1b 43 
     392:	48 f7 e2             	mul    %rdx
     395:	48 89 d0             	mov    %rdx,%rax
     398:	48 c1 e8 12          	shr    $0x12,%rax
     39c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     3a2:	48 89 c1             	mov    %rax,%rcx
     3a5:	ba a0 00 00 00       	mov    $0xa0,%edx
     3aa:	be 07 00 00 00       	mov    $0x7,%esi
     3af:	bf 04 00 00 00       	mov    $0x4,%edi
     3b4:	e8 ab 10 00 00       	call   1464 <UVM_Kern_Act>

        sum=0;
     3b9:	48 c7 05 5c 1c 00 00 	movq   $0x0,0x1c5c(%rip)        # 2020 <sum>
     3c0:	00 00 00 00 

        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
     3c4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     3cb:	00 
     3cc:	eb 60                	jmp    42e <main+0x17e>
        {
            start=__UVM_X64_Read_TSC();
     3ce:	e8 48 fc ff ff       	call   1b <__UVM_X64_Read_TSC>
     3d3:	48 89 05 2e 1c 00 00 	mov    %rax,0x1c2e(%rip)        # 2008 <start>
            UVM_Svc(-1,-1,-1,-1);
     3da:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
     3e1:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
     3e8:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
     3ef:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
     3f6:	e8 f2 fc ff ff       	call   ed <UVM_Svc>
            end=__UVM_X64_Read_TSC();
     3fb:	e8 1b fc ff ff       	call   1b <__UVM_X64_Read_TSC>
     400:	48 89 05 11 1c 00 00 	mov    %rax,0x1c11(%rip)        # 2018 <end>
            sum+=end-start;
     407:	48 8b 15 0a 1c 00 00 	mov    0x1c0a(%rip),%rdx        # 2018 <end>
     40e:	48 8b 05 f3 1b 00 00 	mov    0x1bf3(%rip),%rax        # 2008 <start>
     415:	48 29 c2             	sub    %rax,%rdx
     418:	48 8b 05 01 1c 00 00 	mov    0x1c01(%rip),%rax        # 2020 <sum>
     41f:	48 01 d0             	add    %rdx,%rax
     422:	48 89 05 f7 1b 00 00 	mov    %rax,0x1bf7(%rip)        # 2020 <sum>
        for(Count=0;Count<1000000;Count++)
     429:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     42e:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
     435:	00 
     436:	7e 96                	jle    3ce <main+0x11e>
        }
        UVM_LOG_S("\r\nraw");
     438:	bf 39 1d 00 00       	mov    $0x1d39,%edi
     43d:	e8 c7 0c 00 00       	call   1109 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
     442:	48 8b 05 d7 1b 00 00 	mov    0x1bd7(%rip),%rax        # 2020 <sum>
     449:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     450:	de 1b 43 
     453:	48 f7 e2             	mul    %rdx
     456:	48 89 d0             	mov    %rdx,%rax
     459:	48 c1 e8 12          	shr    $0x12,%rax
     45d:	48 89 c7             	mov    %rax,%rdi
     460:	e8 da 09 00 00       	call   e3f <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*2, sum/1000000, 0);
     465:	48 8b 05 b4 1b 00 00 	mov    0x1bb4(%rip),%rax        # 2020 <sum>
     46c:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     473:	de 1b 43 
     476:	48 f7 e2             	mul    %rdx
     479:	48 89 d0             	mov    %rdx,%rax
     47c:	48 c1 e8 12          	shr    $0x12,%rax
     480:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     486:	48 89 c1             	mov    %rax,%rcx
     489:	ba 40 01 00 00       	mov    $0x140,%edx
     48e:	be 07 00 00 00       	mov    $0x7,%esi
     493:	bf 04 00 00 00       	mov    $0x4,%edi
     498:	e8 c7 0f 00 00       	call   1464 <UVM_Kern_Act>

        Cur_Addr=0xFFFF800010000000ULL; //0xFFFF800007000000ULL on phani
     49d:	48 b8 00 00 00 10 00 	movabs $0xffff800010000000,%rax
     4a4:	80 ff ff 
     4a7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, UVM_BOOT_INIT_PROC, Cur_Addr)>=0);
     4ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     4af:	49 89 c0             	mov    %rax,%r8
     4b2:	b9 02 00 00 00       	mov    $0x2,%ecx
     4b7:	ba 0b 00 00 00       	mov    $0xb,%edx
     4bc:	be 00 80 05 00       	mov    $0x58000,%esi
     4c1:	bf 00 00 00 00       	mov    $0x0,%edi
     4c6:	e8 99 16 00 00       	call   1b64 <UVM_Inv_Crt>
     4cb:	48 85 c0             	test   %rax,%rax
     4ce:	79 5d                	jns    52d <main+0x27d>
     4d0:	bf 40 1d 00 00       	mov    $0x1d40,%edi
     4d5:	e8 2f 0c 00 00       	call   1109 <UVM_Print_String>
     4da:	bf 71 1d 00 00       	mov    $0x1d71,%edi
     4df:	e8 25 0c 00 00       	call   1109 <UVM_Print_String>
     4e4:	bf 7d 1d 00 00       	mov    $0x1d7d,%edi
     4e9:	e8 1b 0c 00 00       	call   1109 <UVM_Print_String>
     4ee:	bf b3 00 00 00       	mov    $0xb3,%edi
     4f3:	e8 47 09 00 00       	call   e3f <UVM_Print_Int>
     4f8:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     4fd:	e8 07 0c 00 00       	call   1109 <UVM_Print_String>
     502:	bf 88 1d 00 00       	mov    $0x1d88,%edi
     507:	e8 fd 0b 00 00       	call   1109 <UVM_Print_String>
     50c:	bf 94 1d 00 00       	mov    $0x1d94,%edi
     511:	e8 f3 0b 00 00       	call   1109 <UVM_Print_String>
     516:	bf 97 1d 00 00       	mov    $0x1d97,%edi
     51b:	e8 e9 0b 00 00       	call   1109 <UVM_Print_String>
     520:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     525:	e8 df 0b 00 00       	call   1109 <UVM_Print_String>
     52a:	90                   	nop
     52b:	eb fd                	jmp    52a <main+0x27a>
        Cur_Addr+=UVM_INV_SIZE;
     52d:	48 83 45 f0 50       	addq   $0x50,-0x10(%rbp)
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1, sinvtest,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     532:	b8 78 02 00 00       	mov    $0x278,%eax
     537:	b9 00 00 00 00       	mov    $0x0,%ecx
     53c:	ba 00 00 c0 00       	mov    $0xc00000,%edx
     541:	48 89 c6             	mov    %rax,%rsi
     544:	bf 0b 00 00 00       	mov    $0xb,%edi
     549:	e8 b3 16 00 00       	call   1c01 <UVM_Inv_Set>
     54e:	48 85 c0             	test   %rax,%rax
     551:	79 5d                	jns    5b0 <main+0x300>
     553:	bf 40 1d 00 00       	mov    $0x1d40,%edi
     558:	e8 ac 0b 00 00       	call   1109 <UVM_Print_String>
     55d:	bf 71 1d 00 00       	mov    $0x1d71,%edi
     562:	e8 a2 0b 00 00       	call   1109 <UVM_Print_String>
     567:	bf 7d 1d 00 00       	mov    $0x1d7d,%edi
     56c:	e8 98 0b 00 00       	call   1109 <UVM_Print_String>
     571:	bf b5 00 00 00       	mov    $0xb5,%edi
     576:	e8 c4 08 00 00       	call   e3f <UVM_Print_Int>
     57b:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     580:	e8 84 0b 00 00       	call   1109 <UVM_Print_String>
     585:	bf 88 1d 00 00       	mov    $0x1d88,%edi
     58a:	e8 7a 0b 00 00       	call   1109 <UVM_Print_String>
     58f:	bf 94 1d 00 00       	mov    $0x1d94,%edi
     594:	e8 70 0b 00 00       	call   1109 <UVM_Print_String>
     599:	bf 97 1d 00 00       	mov    $0x1d97,%edi
     59e:	e8 66 0b 00 00       	call   1109 <UVM_Print_String>
     5a3:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     5a8:	e8 5c 0b 00 00       	call   1109 <UVM_Print_String>
     5ad:	90                   	nop
     5ae:	eb fd                	jmp    5ad <main+0x2fd>

        sum=0;
     5b0:	48 c7 05 65 1a 00 00 	movq   $0x0,0x1a65(%rip)        # 2020 <sum>
     5b7:	00 00 00 00 
        sumin=0;
     5bb:	48 c7 05 62 1a 00 00 	movq   $0x0,0x1a62(%rip)        # 2028 <sumin>
     5c2:	00 00 00 00 
        sumout=0;
     5c6:	48 c7 05 5f 1a 00 00 	movq   $0x0,0x1a5f(%rip)        # 2030 <sumout>
     5cd:	00 00 00 00 
        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
     5d1:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     5d8:	00 
     5d9:	e9 97 00 00 00       	jmp    675 <main+0x3c5>
        {
            start=__UVM_X64_Read_TSC();
     5de:	e8 38 fa ff ff       	call   1b <__UVM_X64_Read_TSC>
     5e3:	48 89 05 1e 1a 00 00 	mov    %rax,0x1a1e(%rip)        # 2008 <start>
            UVM_Inv_Act(TEST_INV1,0,0);
     5ea:	ba 00 00 00 00       	mov    $0x0,%edx
     5ef:	be 00 00 00 00       	mov    $0x0,%esi
     5f4:	bf 0b 00 00 00       	mov    $0xb,%edi
     5f9:	e8 5b fa ff ff       	call   59 <UVM_Inv_Act>
            end=__UVM_X64_Read_TSC();
     5fe:	e8 18 fa ff ff       	call   1b <__UVM_X64_Read_TSC>
     603:	48 89 05 0e 1a 00 00 	mov    %rax,0x1a0e(%rip)        # 2018 <end>
            sum+=end-start;
     60a:	48 8b 15 07 1a 00 00 	mov    0x1a07(%rip),%rdx        # 2018 <end>
     611:	48 8b 05 f0 19 00 00 	mov    0x19f0(%rip),%rax        # 2008 <start>
     618:	48 29 c2             	sub    %rax,%rdx
     61b:	48 8b 05 fe 19 00 00 	mov    0x19fe(%rip),%rax        # 2020 <sum>
     622:	48 01 d0             	add    %rdx,%rax
     625:	48 89 05 f4 19 00 00 	mov    %rax,0x19f4(%rip)        # 2020 <sum>
            sumin+=middle-start;
     62c:	48 8b 15 dd 19 00 00 	mov    0x19dd(%rip),%rdx        # 2010 <middle>
     633:	48 8b 05 ce 19 00 00 	mov    0x19ce(%rip),%rax        # 2008 <start>
     63a:	48 29 c2             	sub    %rax,%rdx
     63d:	48 8b 05 e4 19 00 00 	mov    0x19e4(%rip),%rax        # 2028 <sumin>
     644:	48 01 d0             	add    %rdx,%rax
     647:	48 89 05 da 19 00 00 	mov    %rax,0x19da(%rip)        # 2028 <sumin>
            sumout+=end-middle;
     64e:	48 8b 15 c3 19 00 00 	mov    0x19c3(%rip),%rdx        # 2018 <end>
     655:	48 8b 05 b4 19 00 00 	mov    0x19b4(%rip),%rax        # 2010 <middle>
     65c:	48 29 c2             	sub    %rax,%rdx
     65f:	48 8b 05 ca 19 00 00 	mov    0x19ca(%rip),%rax        # 2030 <sumout>
     666:	48 01 d0             	add    %rdx,%rax
     669:	48 89 05 c0 19 00 00 	mov    %rax,0x19c0(%rip)        # 2030 <sumout>
        for(Count=0;Count<1000000;Count++)
     670:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     675:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
     67c:	00 
     67d:	0f 8e 5b ff ff ff    	jle    5de <main+0x32e>
        }
        UVM_LOG_S("\r\ninv");
     683:	bf a0 1d 00 00       	mov    $0x1da0,%edi
     688:	e8 7c 0a 00 00       	call   1109 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
     68d:	48 8b 05 8c 19 00 00 	mov    0x198c(%rip),%rax        # 2020 <sum>
     694:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     69b:	de 1b 43 
     69e:	48 f7 e2             	mul    %rdx
     6a1:	48 89 d0             	mov    %rdx,%rax
     6a4:	48 c1 e8 12          	shr    $0x12,%rax
     6a8:	48 89 c7             	mov    %rax,%rdi
     6ab:	e8 8f 07 00 00       	call   e3f <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*3, sum/1000000, 0);
     6b0:	48 8b 05 69 19 00 00 	mov    0x1969(%rip),%rax        # 2020 <sum>
     6b7:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     6be:	de 1b 43 
     6c1:	48 f7 e2             	mul    %rdx
     6c4:	48 89 d0             	mov    %rdx,%rax
     6c7:	48 c1 e8 12          	shr    $0x12,%rax
     6cb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     6d1:	48 89 c1             	mov    %rax,%rcx
     6d4:	ba e0 01 00 00       	mov    $0x1e0,%edx
     6d9:	be 07 00 00 00       	mov    $0x7,%esi
     6de:	bf 04 00 00 00       	mov    $0x4,%edi
     6e3:	e8 7c 0d 00 00       	call   1464 <UVM_Kern_Act>
        UVM_LOG_S("\r\nin");
     6e8:	bf a6 1d 00 00       	mov    $0x1da6,%edi
     6ed:	e8 17 0a 00 00       	call   1109 <UVM_Print_String>
        UVM_LOG_I(sumin/1000000);
     6f2:	48 8b 05 2f 19 00 00 	mov    0x192f(%rip),%rax        # 2028 <sumin>
     6f9:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     700:	de 1b 43 
     703:	48 f7 e2             	mul    %rdx
     706:	48 89 d0             	mov    %rdx,%rax
     709:	48 c1 e8 12          	shr    $0x12,%rax
     70d:	48 89 c7             	mov    %rax,%rdi
     710:	e8 2a 07 00 00       	call   e3f <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*4, sumin/1000000, 0);
     715:	48 8b 05 0c 19 00 00 	mov    0x190c(%rip),%rax        # 2028 <sumin>
     71c:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     723:	de 1b 43 
     726:	48 f7 e2             	mul    %rdx
     729:	48 89 d0             	mov    %rdx,%rax
     72c:	48 c1 e8 12          	shr    $0x12,%rax
     730:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     736:	48 89 c1             	mov    %rax,%rcx
     739:	ba 80 02 00 00       	mov    $0x280,%edx
     73e:	be 07 00 00 00       	mov    $0x7,%esi
     743:	bf 04 00 00 00       	mov    $0x4,%edi
     748:	e8 17 0d 00 00       	call   1464 <UVM_Kern_Act>
        UVM_LOG_S("\r\nout");
     74d:	bf ab 1d 00 00       	mov    $0x1dab,%edi
     752:	e8 b2 09 00 00       	call   1109 <UVM_Print_String>
        UVM_LOG_I(sumout/1000000);
     757:	48 8b 05 d2 18 00 00 	mov    0x18d2(%rip),%rax        # 2030 <sumout>
     75e:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     765:	de 1b 43 
     768:	48 f7 e2             	mul    %rdx
     76b:	48 89 d0             	mov    %rdx,%rax
     76e:	48 c1 e8 12          	shr    $0x12,%rax
     772:	48 89 c7             	mov    %rax,%rdi
     775:	e8 c5 06 00 00       	call   e3f <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*5, sumout/1000000, 0);
     77a:	48 8b 05 af 18 00 00 	mov    0x18af(%rip),%rax        # 2030 <sumout>
     781:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     788:	de 1b 43 
     78b:	48 f7 e2             	mul    %rdx
     78e:	48 89 d0             	mov    %rdx,%rax
     791:	48 c1 e8 12          	shr    $0x12,%rax
     795:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     79b:	48 89 c1             	mov    %rax,%rcx
     79e:	ba 20 03 00 00       	mov    $0x320,%edx
     7a3:	be 07 00 00 00       	mov    $0x7,%esi
     7a8:	bf 04 00 00 00       	mov    $0x4,%edi
     7ad:	e8 b2 0c 00 00       	call   1464 <UVM_Kern_Act>

        /* Stub test */
        sum=0;
     7b2:	48 c7 05 63 18 00 00 	movq   $0x0,0x1863(%rip)        # 2020 <sum>
     7b9:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
     7bd:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     7c4:	00 
     7c5:	eb 58                	jmp    81f <main+0x56f>
        {
            start=__UVM_X64_Read_TSC();
     7c7:	e8 4f f8 ff ff       	call   1b <__UVM_X64_Read_TSC>
     7cc:	48 89 05 35 18 00 00 	mov    %rax,0x1835(%rip)        # 2008 <start>
            UVM_Inv_Act_Dummy(TEST_INV1,0,0);
     7d3:	ba 00 00 00 00       	mov    $0x0,%edx
     7d8:	be 00 00 00 00       	mov    $0x0,%esi
     7dd:	bf 0b 00 00 00       	mov    $0xb,%edi
     7e2:	b8 00 00 00 00       	mov    $0x0,%eax
     7e7:	e8 b3 f8 ff ff       	call   9f <UVM_Inv_Act_Dummy>
            end=__UVM_X64_Read_TSC();
     7ec:	e8 2a f8 ff ff       	call   1b <__UVM_X64_Read_TSC>
     7f1:	48 89 05 20 18 00 00 	mov    %rax,0x1820(%rip)        # 2018 <end>
            sum+=end-start;
     7f8:	48 8b 15 19 18 00 00 	mov    0x1819(%rip),%rdx        # 2018 <end>
     7ff:	48 8b 05 02 18 00 00 	mov    0x1802(%rip),%rax        # 2008 <start>
     806:	48 29 c2             	sub    %rax,%rdx
     809:	48 8b 05 10 18 00 00 	mov    0x1810(%rip),%rax        # 2020 <sum>
     810:	48 01 d0             	add    %rdx,%rax
     813:	48 89 05 06 18 00 00 	mov    %rax,0x1806(%rip)        # 2020 <sum>
        for(Count=0;Count<1000000;Count++)
     81a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     81f:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
     826:	00 
     827:	7e 9e                	jle    7c7 <main+0x517>
        }
        UVM_LOG_S("\r\ninv-dummy");
     829:	bf b1 1d 00 00       	mov    $0x1db1,%edi
     82e:	e8 d6 08 00 00       	call   1109 <UVM_Print_String>
        UVM_LOG_I(sum/1000000);
     833:	48 8b 05 e6 17 00 00 	mov    0x17e6(%rip),%rax        # 2020 <sum>
     83a:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     841:	de 1b 43 
     844:	48 f7 e2             	mul    %rdx
     847:	48 89 d0             	mov    %rdx,%rax
     84a:	48 c1 e8 12          	shr    $0x12,%rax
     84e:	48 89 c7             	mov    %rax,%rdi
     851:	e8 e9 05 00 00       	call   e3f <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*6, sum/1000000, 0);
     856:	48 8b 05 c3 17 00 00 	mov    0x17c3(%rip),%rax        # 2020 <sum>
     85d:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     864:	de 1b 43 
     867:	48 f7 e2             	mul    %rdx
     86a:	48 89 d0             	mov    %rdx,%rax
     86d:	48 c1 e8 12          	shr    $0x12,%rax
     871:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     877:	48 89 c1             	mov    %rax,%rcx
     87a:	ba c0 03 00 00       	mov    $0x3c0,%edx
     87f:	be 07 00 00 00       	mov    $0x7,%esi
     884:	bf 04 00 00 00       	mov    $0x4,%edi
     889:	e8 d6 0b 00 00       	call   1464 <UVM_Kern_Act>

        /* crazyopt test - single callq/retq */
        sum=0;
     88e:	48 c7 05 87 17 00 00 	movq   $0x0,0x1787(%rip)        # 2020 <sum>
     895:	00 00 00 00 
        for(Count=0;Count<1000000;Count++)
     899:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     8a0:	00 
     8a1:	eb 53                	jmp    8f6 <main+0x646>
        {
            start=__UVM_X64_Read_TSC();
     8a3:	e8 73 f7 ff ff       	call   1b <__UVM_X64_Read_TSC>
     8a8:	48 89 05 59 17 00 00 	mov    %rax,0x1759(%rip)        # 2008 <start>
            UVM_cret(0,0);
     8af:	be 00 00 00 00       	mov    $0x0,%esi
     8b4:	bf 00 00 00 00       	mov    $0x0,%edi
     8b9:	b8 00 00 00 00       	mov    $0x0,%eax
     8be:	e8 20 f8 ff ff       	call   e3 <UVM_cret>
            end=__UVM_X64_Read_TSC();
     8c3:	e8 53 f7 ff ff       	call   1b <__UVM_X64_Read_TSC>
     8c8:	48 89 05 49 17 00 00 	mov    %rax,0x1749(%rip)        # 2018 <end>
            sum+=end-start;
     8cf:	48 8b 15 42 17 00 00 	mov    0x1742(%rip),%rdx        # 2018 <end>
     8d6:	48 8b 05 2b 17 00 00 	mov    0x172b(%rip),%rax        # 2008 <start>
     8dd:	48 29 c2             	sub    %rax,%rdx
     8e0:	48 8b 05 39 17 00 00 	mov    0x1739(%rip),%rax        # 2020 <sum>
     8e7:	48 01 d0             	add    %rdx,%rax
     8ea:	48 89 05 2f 17 00 00 	mov    %rax,0x172f(%rip)        # 2020 <sum>
        for(Count=0;Count<1000000;Count++)
     8f1:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
     8f6:	48 81 7d f8 3f 42 0f 	cmpq   $0xf423f,-0x8(%rbp)
     8fd:	00 
     8fe:	7e a3                	jle    8a3 <main+0x5f3>
        }
        UVM_LOG_S("\r\ncallret");
     900:	bf bd 1d 00 00       	mov    $0x1dbd,%edi
     905:	e8 ff 07 00 00       	call   1109 <UVM_Print_String>
        UVM_LOG_I(sum/(1000000/10));
     90a:	48 8b 05 0f 17 00 00 	mov    0x170f(%rip),%rax        # 2020 <sum>
     911:	48 c1 e8 05          	shr    $0x5,%rax
     915:	48 ba 43 78 b4 71 c4 	movabs $0xa7c5ac471b47843,%rdx
     91c:	5a 7c 0a 
     91f:	48 f7 e2             	mul    %rdx
     922:	48 89 d0             	mov    %rdx,%rax
     925:	48 c1 e8 07          	shr    $0x7,%rax
     929:	48 89 c7             	mov    %rax,%rdi
     92c:	e8 0e 05 00 00       	call   e3f <UVM_Print_Int>
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*7, sum/1000000, 0);
     931:	48 8b 05 e8 16 00 00 	mov    0x16e8(%rip),%rax        # 2020 <sum>
     938:	48 ba db 34 b6 d7 82 	movabs $0x431bde82d7b634db,%rdx
     93f:	de 1b 43 
     942:	48 f7 e2             	mul    %rdx
     945:	48 89 d0             	mov    %rdx,%rax
     948:	48 c1 e8 12          	shr    $0x12,%rax
     94c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     952:	48 89 c1             	mov    %rax,%rcx
     955:	ba 60 04 00 00       	mov    $0x460,%edx
     95a:	be 07 00 00 00       	mov    $0x7,%esi
     95f:	bf 04 00 00 00       	mov    $0x4,%edi
     964:	e8 fb 0a 00 00       	call   1464 <UVM_Kern_Act>

        /* We create this in Kmem1 */
        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     969:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     96d:	49 89 c1             	mov    %rax,%r9
     970:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     976:	b9 02 00 00 00       	mov    $0x2,%ecx
     97b:	ba 09 00 00 00       	mov    $0x9,%edx
     980:	be 00 80 05 00       	mov    $0x58000,%esi
     985:	bf 00 00 00 00       	mov    $0x0,%edi
     98a:	e8 47 0e 00 00       	call   17d6 <UVM_Thd_Crt>
     98f:	48 85 c0             	test   %rax,%rax
     992:	79 5d                	jns    9f1 <main+0x741>
     994:	bf 40 1d 00 00       	mov    $0x1d40,%edi
     999:	e8 6b 07 00 00       	call   1109 <UVM_Print_String>
     99e:	bf 71 1d 00 00       	mov    $0x1d71,%edi
     9a3:	e8 61 07 00 00       	call   1109 <UVM_Print_String>
     9a8:	bf 7d 1d 00 00       	mov    $0x1d7d,%edi
     9ad:	e8 57 07 00 00       	call   1109 <UVM_Print_String>
     9b2:	bf e9 00 00 00       	mov    $0xe9,%edi
     9b7:	e8 83 04 00 00       	call   e3f <UVM_Print_Int>
     9bc:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     9c1:	e8 43 07 00 00       	call   1109 <UVM_Print_String>
     9c6:	bf 88 1d 00 00       	mov    $0x1d88,%edi
     9cb:	e8 39 07 00 00       	call   1109 <UVM_Print_String>
     9d0:	bf 94 1d 00 00       	mov    $0x1d94,%edi
     9d5:	e8 2f 07 00 00       	call   1109 <UVM_Print_String>
     9da:	bf 97 1d 00 00       	mov    $0x1d97,%edi
     9df:	e8 25 07 00 00       	call   1109 <UVM_Print_String>
     9e4:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     9e9:	e8 1b 07 00 00       	call   1109 <UVM_Print_String>
     9ee:	90                   	nop
     9ef:	eb fd                	jmp    9ee <main+0x73e>
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     9f1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     9f7:	b9 00 00 00 00       	mov    $0x0,%ecx
     9fc:	b8 00 00 00 80       	mov    $0x80000000,%eax
     a01:	48 89 c2             	mov    %rax,%rdx
     a04:	be 00 80 03 00       	mov    $0x38000,%esi
     a09:	bf 09 00 00 00       	mov    $0x9,%edi
     a0e:	e8 ec 0e 00 00       	call   18ff <UVM_Thd_Sched_Bind>
     a13:	48 85 c0             	test   %rax,%rax
     a16:	79 5d                	jns    a75 <main+0x7c5>
     a18:	bf 40 1d 00 00       	mov    $0x1d40,%edi
     a1d:	e8 e7 06 00 00       	call   1109 <UVM_Print_String>
     a22:	bf 71 1d 00 00       	mov    $0x1d71,%edi
     a27:	e8 dd 06 00 00       	call   1109 <UVM_Print_String>
     a2c:	bf 7d 1d 00 00       	mov    $0x1d7d,%edi
     a31:	e8 d3 06 00 00       	call   1109 <UVM_Print_String>
     a36:	bf ea 00 00 00       	mov    $0xea,%edi
     a3b:	e8 ff 03 00 00       	call   e3f <UVM_Print_Int>
     a40:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     a45:	e8 bf 06 00 00       	call   1109 <UVM_Print_String>
     a4a:	bf 88 1d 00 00       	mov    $0x1d88,%edi
     a4f:	e8 b5 06 00 00       	call   1109 <UVM_Print_String>
     a54:	bf 94 1d 00 00       	mov    $0x1d94,%edi
     a59:	e8 ab 06 00 00       	call   1109 <UVM_Print_String>
     a5e:	bf 97 1d 00 00       	mov    $0x1d97,%edi
     a63:	e8 a1 06 00 00       	call   1109 <UVM_Print_String>
     a68:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     a6d:	e8 97 06 00 00       	call   1109 <UVM_Print_String>
     a72:	90                   	nop
     a73:	eb fd                	jmp    a72 <main+0x7c2>
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     a75:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
     a7c:	ff ff 7f 
     a7f:	48 89 c2             	mov    %rax,%rdx
     a82:	be 00 80 03 00       	mov    $0x38000,%esi
     a87:	bf 09 00 00 00       	mov    $0x9,%edi
     a8c:	e8 6d 0f 00 00       	call   19fe <UVM_Thd_Time_Xfer>
     a91:	48 85 c0             	test   %rax,%rax
     a94:	79 5d                	jns    af3 <main+0x843>
     a96:	bf 40 1d 00 00       	mov    $0x1d40,%edi
     a9b:	e8 69 06 00 00       	call   1109 <UVM_Print_String>
     aa0:	bf 71 1d 00 00       	mov    $0x1d71,%edi
     aa5:	e8 5f 06 00 00       	call   1109 <UVM_Print_String>
     aaa:	bf 7d 1d 00 00       	mov    $0x1d7d,%edi
     aaf:	e8 55 06 00 00       	call   1109 <UVM_Print_String>
     ab4:	bf eb 00 00 00       	mov    $0xeb,%edi
     ab9:	e8 81 03 00 00       	call   e3f <UVM_Print_Int>
     abe:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     ac3:	e8 41 06 00 00       	call   1109 <UVM_Print_String>
     ac8:	bf 88 1d 00 00       	mov    $0x1d88,%edi
     acd:	e8 37 06 00 00       	call   1109 <UVM_Print_String>
     ad2:	bf 94 1d 00 00       	mov    $0x1d94,%edi
     ad7:	e8 2d 06 00 00       	call   1109 <UVM_Print_String>
     adc:	bf 97 1d 00 00       	mov    $0x1d97,%edi
     ae1:	e8 23 06 00 00       	call   1109 <UVM_Print_String>
     ae6:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     aeb:	e8 19 06 00 00       	call   1109 <UVM_Print_String>
     af0:	90                   	nop
     af1:	eb fd                	jmp    af0 <main+0x840>
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD1,test,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);
     af3:	b8 7e 01 00 00       	mov    $0x17e,%eax
     af8:	b9 00 00 00 00       	mov    $0x0,%ecx
     afd:	ba 00 00 c0 00       	mov    $0xc00000,%edx
     b02:	48 89 c6             	mov    %rax,%rsi
     b05:	bf 09 00 00 00       	mov    $0x9,%edi
     b0a:	e8 72 0d 00 00       	call   1881 <UVM_Thd_Exec_Set>
     b0f:	48 85 c0             	test   %rax,%rax
     b12:	79 5d                	jns    b71 <main+0x8c1>
     b14:	bf 40 1d 00 00       	mov    $0x1d40,%edi
     b19:	e8 eb 05 00 00       	call   1109 <UVM_Print_String>
     b1e:	bf 71 1d 00 00       	mov    $0x1d71,%edi
     b23:	e8 e1 05 00 00       	call   1109 <UVM_Print_String>
     b28:	bf 7d 1d 00 00       	mov    $0x1d7d,%edi
     b2d:	e8 d7 05 00 00       	call   1109 <UVM_Print_String>
     b32:	bf ec 00 00 00       	mov    $0xec,%edi
     b37:	e8 03 03 00 00       	call   e3f <UVM_Print_Int>
     b3c:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     b41:	e8 c3 05 00 00       	call   1109 <UVM_Print_String>
     b46:	bf 88 1d 00 00       	mov    $0x1d88,%edi
     b4b:	e8 b9 05 00 00       	call   1109 <UVM_Print_String>
     b50:	bf 94 1d 00 00       	mov    $0x1d94,%edi
     b55:	e8 af 05 00 00       	call   1109 <UVM_Print_String>
     b5a:	bf 97 1d 00 00       	mov    $0x1d97,%edi
     b5f:	e8 a5 05 00 00       	call   1109 <UVM_Print_String>
     b64:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     b69:	e8 9b 05 00 00       	call   1109 <UVM_Print_String>
     b6e:	90                   	nop
     b6f:	eb fd                	jmp    b6e <main+0x8be>

        Cur_Addr+=UVM_THD_SIZE;
     b71:	48 81 45 f0 d0 09 00 	addq   $0x9d0,-0x10(%rbp)
     b78:	00 
        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
     b79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     b7d:	49 89 c1             	mov    %rax,%r9
     b80:	41 b8 0a 00 00 00    	mov    $0xa,%r8d
     b86:	b9 02 00 00 00       	mov    $0x2,%ecx
     b8b:	ba 0a 00 00 00       	mov    $0xa,%edx
     b90:	be 00 80 05 00       	mov    $0x58000,%esi
     b95:	bf 00 00 00 00       	mov    $0x0,%edi
     b9a:	e8 37 0c 00 00       	call   17d6 <UVM_Thd_Crt>
     b9f:	48 85 c0             	test   %rax,%rax
     ba2:	79 5d                	jns    c01 <main+0x951>
     ba4:	bf 40 1d 00 00       	mov    $0x1d40,%edi
     ba9:	e8 5b 05 00 00       	call   1109 <UVM_Print_String>
     bae:	bf 71 1d 00 00       	mov    $0x1d71,%edi
     bb3:	e8 51 05 00 00       	call   1109 <UVM_Print_String>
     bb8:	bf 7d 1d 00 00       	mov    $0x1d7d,%edi
     bbd:	e8 47 05 00 00       	call   1109 <UVM_Print_String>
     bc2:	bf ef 00 00 00       	mov    $0xef,%edi
     bc7:	e8 73 02 00 00       	call   e3f <UVM_Print_Int>
     bcc:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     bd1:	e8 33 05 00 00       	call   1109 <UVM_Print_String>
     bd6:	bf 88 1d 00 00       	mov    $0x1d88,%edi
     bdb:	e8 29 05 00 00       	call   1109 <UVM_Print_String>
     be0:	bf 94 1d 00 00       	mov    $0x1d94,%edi
     be5:	e8 1f 05 00 00       	call   1109 <UVM_Print_String>
     bea:	bf 97 1d 00 00       	mov    $0x1d97,%edi
     bef:	e8 15 05 00 00       	call   1109 <UVM_Print_String>
     bf4:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     bf9:	e8 0b 05 00 00       	call   1109 <UVM_Print_String>
     bfe:	90                   	nop
     bff:	eb fd                	jmp    bfe <main+0x94e>
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
     c01:	41 b8 00 00 00 00    	mov    $0x0,%r8d
     c07:	b9 00 00 00 00       	mov    $0x0,%ecx
     c0c:	b8 00 00 00 80       	mov    $0x80000000,%eax
     c11:	48 89 c2             	mov    %rax,%rdx
     c14:	be 00 80 03 00       	mov    $0x38000,%esi
     c19:	bf 0a 00 00 00       	mov    $0xa,%edi
     c1e:	e8 dc 0c 00 00       	call   18ff <UVM_Thd_Sched_Bind>
     c23:	48 85 c0             	test   %rax,%rax
     c26:	79 5d                	jns    c85 <main+0x9d5>
     c28:	bf 40 1d 00 00       	mov    $0x1d40,%edi
     c2d:	e8 d7 04 00 00       	call   1109 <UVM_Print_String>
     c32:	bf 71 1d 00 00       	mov    $0x1d71,%edi
     c37:	e8 cd 04 00 00       	call   1109 <UVM_Print_String>
     c3c:	bf 7d 1d 00 00       	mov    $0x1d7d,%edi
     c41:	e8 c3 04 00 00       	call   1109 <UVM_Print_String>
     c46:	bf f0 00 00 00       	mov    $0xf0,%edi
     c4b:	e8 ef 01 00 00       	call   e3f <UVM_Print_Int>
     c50:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     c55:	e8 af 04 00 00       	call   1109 <UVM_Print_String>
     c5a:	bf 88 1d 00 00       	mov    $0x1d88,%edi
     c5f:	e8 a5 04 00 00       	call   1109 <UVM_Print_String>
     c64:	bf 94 1d 00 00       	mov    $0x1d94,%edi
     c69:	e8 9b 04 00 00       	call   1109 <UVM_Print_String>
     c6e:	bf 97 1d 00 00       	mov    $0x1d97,%edi
     c73:	e8 91 04 00 00       	call   1109 <UVM_Print_String>
     c78:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     c7d:	e8 87 04 00 00       	call   1109 <UVM_Print_String>
     c82:	90                   	nop
     c83:	eb fd                	jmp    c82 <main+0x9d2>
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
     c85:	48 b8 fe ff ff ff ff 	movabs $0x7ffffffffffffffe,%rax
     c8c:	ff ff 7f 
     c8f:	48 89 c2             	mov    %rax,%rdx
     c92:	be 00 80 03 00       	mov    $0x38000,%esi
     c97:	bf 0a 00 00 00       	mov    $0xa,%edi
     c9c:	e8 5d 0d 00 00       	call   19fe <UVM_Thd_Time_Xfer>
     ca1:	48 85 c0             	test   %rax,%rax
     ca4:	79 5d                	jns    d03 <main+0xa53>
     ca6:	bf 40 1d 00 00       	mov    $0x1d40,%edi
     cab:	e8 59 04 00 00       	call   1109 <UVM_Print_String>
     cb0:	bf 71 1d 00 00       	mov    $0x1d71,%edi
     cb5:	e8 4f 04 00 00       	call   1109 <UVM_Print_String>
     cba:	bf 7d 1d 00 00       	mov    $0x1d7d,%edi
     cbf:	e8 45 04 00 00       	call   1109 <UVM_Print_String>
     cc4:	bf f1 00 00 00       	mov    $0xf1,%edi
     cc9:	e8 71 01 00 00       	call   e3f <UVM_Print_Int>
     cce:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     cd3:	e8 31 04 00 00       	call   1109 <UVM_Print_String>
     cd8:	bf 88 1d 00 00       	mov    $0x1d88,%edi
     cdd:	e8 27 04 00 00       	call   1109 <UVM_Print_String>
     ce2:	bf 94 1d 00 00       	mov    $0x1d94,%edi
     ce7:	e8 1d 04 00 00       	call   1109 <UVM_Print_String>
     cec:	bf 97 1d 00 00       	mov    $0x1d97,%edi
     cf1:	e8 13 04 00 00       	call   1109 <UVM_Print_String>
     cf6:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     cfb:	e8 09 04 00 00       	call   1109 <UVM_Print_String>
     d00:	90                   	nop
     d01:	eb fd                	jmp    d00 <main+0xa50>
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD2,test2,13*UVM_POW2(RME_PGT_SIZE_1M),1)>=0);
     d03:	b8 5f 02 00 00       	mov    $0x25f,%eax
     d08:	b9 01 00 00 00       	mov    $0x1,%ecx
     d0d:	ba 00 00 d0 00       	mov    $0xd00000,%edx
     d12:	48 89 c6             	mov    %rax,%rsi
     d15:	bf 0a 00 00 00       	mov    $0xa,%edi
     d1a:	e8 62 0b 00 00       	call   1881 <UVM_Thd_Exec_Set>
     d1f:	48 85 c0             	test   %rax,%rax
     d22:	79 5d                	jns    d81 <main+0xad1>
     d24:	bf 40 1d 00 00       	mov    $0x1d40,%edi
     d29:	e8 db 03 00 00       	call   1109 <UVM_Print_String>
     d2e:	bf 71 1d 00 00       	mov    $0x1d71,%edi
     d33:	e8 d1 03 00 00       	call   1109 <UVM_Print_String>
     d38:	bf 7d 1d 00 00       	mov    $0x1d7d,%edi
     d3d:	e8 c7 03 00 00       	call   1109 <UVM_Print_String>
     d42:	bf f2 00 00 00       	mov    $0xf2,%edi
     d47:	e8 f3 00 00 00       	call   e3f <UVM_Print_Int>
     d4c:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     d51:	e8 b3 03 00 00       	call   1109 <UVM_Print_String>
     d56:	bf 88 1d 00 00       	mov    $0x1d88,%edi
     d5b:	e8 a9 03 00 00       	call   1109 <UVM_Print_String>
     d60:	bf 94 1d 00 00       	mov    $0x1d94,%edi
     d65:	e8 9f 03 00 00       	call   1109 <UVM_Print_String>
     d6a:	bf 97 1d 00 00       	mov    $0x1d97,%edi
     d6f:	e8 95 03 00 00       	call   1109 <UVM_Print_String>
     d74:	bf 85 1d 00 00       	mov    $0x1d85,%edi
     d79:	e8 8b 03 00 00       	call   1109 <UVM_Print_String>
     d7e:	90                   	nop
     d7f:	eb fd                	jmp    d7e <main+0xace>

        UVM_Thd_Swt(TEST_THD1,0);
     d81:	be 00 00 00 00       	mov    $0x0,%esi
     d86:	bf 09 00 00 00       	mov    $0x9,%edi
     d8b:	e8 a9 0c 00 00       	call   1a39 <UVM_Thd_Swt>
        UVM_LOG_S("\r\nShould not get here");
     d90:	bf c7 1d 00 00       	mov    $0x1dc7,%edi
     d95:	e8 6f 03 00 00       	call   1109 <UVM_Print_String>
core-local ctxsw wrt.cores
core-local IPC wrt.cores
map/unmap pages wrt.cores
WCIRT*/

    while(1);
     d9a:	90                   	nop
     d9b:	90                   	nop
     d9c:	eb fd                	jmp    d9b <main+0xaeb>

0000000000000d9e <UVM_List_Crt>:
Input       : volatile struct UVM_List* Head - The pointer to the list head.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Crt(volatile struct UVM_List* Head)
{
     d9e:	f3 0f 1e fa          	endbr64
     da2:	55                   	push   %rbp
     da3:	48 89 e5             	mov    %rsp,%rbp
     da6:	48 83 ec 08          	sub    $0x8,%rsp
     daa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    Head->Prev=(struct UVM_List*)Head;
     dae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     db2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     db6:	48 89 10             	mov    %rdx,(%rax)
    Head->Next=(struct UVM_List*)Head;
     db9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     dbd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     dc1:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
     dc5:	90                   	nop
     dc6:	c9                   	leave
     dc7:	c3                   	ret

0000000000000dc8 <UVM_List_Del>:
              volatile struct UVM_List* Next - The next node of the target node.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_List_Del(volatile struct UVM_List* Prev,volatile struct UVM_List* Next)
{
     dc8:	f3 0f 1e fa          	endbr64
     dcc:	55                   	push   %rbp
     dcd:	48 89 e5             	mov    %rsp,%rbp
     dd0:	48 83 ec 10          	sub    $0x10,%rsp
     dd4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     dd8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    Next->Prev=(struct UVM_List*)Prev;
     ddc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     de0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     de4:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)Next;
     de7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     deb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     def:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
     df3:	90                   	nop
     df4:	c9                   	leave
     df5:	c3                   	ret

0000000000000df6 <UVM_List_Ins>:
Return      : None.
******************************************************************************/
void UVM_List_Ins(volatile struct UVM_List* New,
                  volatile struct UVM_List* Prev,
                  volatile struct UVM_List* Next)
{
     df6:	f3 0f 1e fa          	endbr64
     dfa:	55                   	push   %rbp
     dfb:	48 89 e5             	mov    %rsp,%rbp
     dfe:	48 83 ec 18          	sub    $0x18,%rsp
     e02:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     e06:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     e0a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    Next->Prev=(struct UVM_List*)New;
     e0e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     e12:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     e16:	48 89 10             	mov    %rdx,(%rax)
    New->Next=(struct UVM_List*)Next;
     e19:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e1d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
     e21:	48 89 50 08          	mov    %rdx,0x8(%rax)
    New->Prev=(struct UVM_List*)Prev;
     e25:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e29:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     e2d:	48 89 10             	mov    %rdx,(%rax)
    Prev->Next=(struct UVM_List*)New;
     e30:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e34:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
     e38:	48 89 50 08          	mov    %rdx,0x8(%rax)
}
     e3c:	90                   	nop
     e3d:	c9                   	leave
     e3e:	c3                   	ret

0000000000000e3f <UVM_Print_Int>:
Input       : cnt_t Int - The integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Int(cnt_t Int)
{
     e3f:	f3 0f 1e fa          	endbr64
     e43:	55                   	push   %rbp
     e44:	48 89 e5             	mov    %rsp,%rbp
     e47:	48 83 ec 30          	sub    $0x30,%rsp
     e4b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    cnt_t Count;
    cnt_t Num;
    ptr_t Div;
    
    /* how many digits are there? */
    if(Int==0)
     e4f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
     e54:	75 14                	jne    e6a <UVM_Print_Int+0x2b>
    {
        UVM_Putchar('0');
     e56:	bf 30 00 00 00       	mov    $0x30,%edi
     e5b:	e8 f3 0d 00 00       	call   1c53 <UVM_Putchar>
        return 1;
     e60:	b8 01 00 00 00       	mov    $0x1,%eax
     e65:	e9 d8 01 00 00       	jmp    1042 <UVM_Print_Int+0x203>
    }
    else if(Int<0)
     e6a:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
     e6f:	0f 89 f1 00 00 00    	jns    f66 <UVM_Print_Int+0x127>
    {
        /* How many digits are there? */
        Count=0;
     e75:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
     e7c:	00 
        Div=1;
     e7d:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
     e84:	00 
        Iter=-Int;
     e85:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     e89:	48 f7 d8             	neg    %rax
     e8c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
     e90:	eb 36                	jmp    ec8 <UVM_Print_Int+0x89>
        {
            Iter/=10;
     e92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e96:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     e9d:	cc cc cc 
     ea0:	48 f7 e2             	mul    %rdx
     ea3:	48 89 d0             	mov    %rdx,%rax
     ea6:	48 c1 e8 03          	shr    $0x3,%rax
     eaa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
     eae:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
     eb3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     eb7:	48 89 d0             	mov    %rdx,%rax
     eba:	48 c1 e0 02          	shl    $0x2,%rax
     ebe:	48 01 d0             	add    %rdx,%rax
     ec1:	48 01 c0             	add    %rax,%rax
     ec4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
     ec8:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
     ecd:	75 c3                	jne    e92 <UVM_Print_Int+0x53>
        }
        Div/=10;
     ecf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     ed3:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     eda:	cc cc cc 
     edd:	48 f7 e2             	mul    %rdx
     ee0:	48 89 d0             	mov    %rdx,%rax
     ee3:	48 c1 e8 03          	shr    $0x3,%rax
     ee7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        UVM_Putchar('-');
     eeb:	bf 2d 00 00 00       	mov    $0x2d,%edi
     ef0:	e8 5e 0d 00 00       	call   1c53 <UVM_Putchar>
        Iter=-Int;
     ef5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     ef9:	48 f7 d8             	neg    %rax
     efc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count+1;
     f00:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     f04:	48 83 c0 01          	add    $0x1,%rax
     f08:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
     f0c:	eb 4c                	jmp    f5a <UVM_Print_Int+0x11b>
        {
            Count--;
     f0e:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
     f13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f17:	ba 00 00 00 00       	mov    $0x0,%edx
     f1c:	48 f7 75 e0          	divq   -0x20(%rbp)
     f20:	83 c0 30             	add    $0x30,%eax
     f23:	0f be c0             	movsbl %al,%eax
     f26:	89 c7                	mov    %eax,%edi
     f28:	e8 26 0d 00 00       	call   1c53 <UVM_Putchar>
            Iter=Iter%Div;
     f2d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f31:	ba 00 00 00 00       	mov    $0x0,%edx
     f36:	48 f7 75 e0          	divq   -0x20(%rbp)
     f3a:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
     f3e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     f42:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     f49:	cc cc cc 
     f4c:	48 f7 e2             	mul    %rdx
     f4f:	48 89 d0             	mov    %rdx,%rax
     f52:	48 c1 e8 03          	shr    $0x3,%rax
     f56:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
     f5a:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
     f5f:	7f ad                	jg     f0e <UVM_Print_Int+0xcf>
     f61:	e9 d8 00 00 00       	jmp    103e <UVM_Print_Int+0x1ff>
        }
    }
    else
    {
        /* How many digits are there? */
        Count=0;
     f66:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
     f6d:	00 
        Div=1;
     f6e:	48 c7 45 e0 01 00 00 	movq   $0x1,-0x20(%rbp)
     f75:	00 
        Iter=Int;
     f76:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     f7a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while(Iter!=0)
     f7e:	eb 36                	jmp    fb6 <UVM_Print_Int+0x177>
        {
            Iter/=10;
     f80:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f84:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     f8b:	cc cc cc 
     f8e:	48 f7 e2             	mul    %rdx
     f91:	48 89 d0             	mov    %rdx,%rax
     f94:	48 c1 e8 03          	shr    $0x3,%rax
     f98:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            Count++;
     f9c:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
            Div*=10;
     fa1:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
     fa5:	48 89 d0             	mov    %rdx,%rax
     fa8:	48 c1 e0 02          	shl    $0x2,%rax
     fac:	48 01 d0             	add    %rdx,%rax
     faf:	48 01 c0             	add    %rax,%rax
     fb2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Iter!=0)
     fb6:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
     fbb:	75 c3                	jne    f80 <UVM_Print_Int+0x141>
        }
        Div/=10;
     fbd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     fc1:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
     fc8:	cc cc cc 
     fcb:	48 f7 e2             	mul    %rdx
     fce:	48 89 d0             	mov    %rdx,%rax
     fd1:	48 c1 e8 03          	shr    $0x3,%rax
     fd5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        
        Iter=Int;
     fd9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     fdd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        Num=Count;
     fe1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     fe5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        
        while(Count>0)
     fe9:	eb 4c                	jmp    1037 <UVM_Print_Int+0x1f8>
        {
            Count--;
     feb:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            UVM_Putchar(Iter/Div+'0');
     ff0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ff4:	ba 00 00 00 00       	mov    $0x0,%edx
     ff9:	48 f7 75 e0          	divq   -0x20(%rbp)
     ffd:	83 c0 30             	add    $0x30,%eax
    1000:	0f be c0             	movsbl %al,%eax
    1003:	89 c7                	mov    %eax,%edi
    1005:	e8 49 0c 00 00       	call   1c53 <UVM_Putchar>
            Iter=Iter%Div;
    100a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    100e:	ba 00 00 00 00       	mov    $0x0,%edx
    1013:	48 f7 75 e0          	divq   -0x20(%rbp)
    1017:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
            Div/=10;
    101b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    101f:	48 ba cd cc cc cc cc 	movabs $0xcccccccccccccccd,%rdx
    1026:	cc cc cc 
    1029:	48 f7 e2             	mul    %rdx
    102c:	48 89 d0             	mov    %rdx,%rax
    102f:	48 c1 e8 03          	shr    $0x3,%rax
    1033:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
        while(Count>0)
    1037:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    103c:	7f ad                	jg     feb <UVM_Print_Int+0x1ac>
        }
    }
    
    return Num;
    103e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
    1042:	c9                   	leave
    1043:	c3                   	ret

0000000000001044 <UVM_Print_Uint>:
Input       : ptr_t Uint - The unsigned integer to print.
Output      : None.
Return      : cnt_t - The length of the string printed.
******************************************************************************/
cnt_t UVM_Print_Uint(ptr_t Uint)
{
    1044:	f3 0f 1e fa          	endbr64
    1048:	55                   	push   %rbp
    1049:	48 89 e5             	mov    %rsp,%rbp
    104c:	48 83 ec 30          	sub    $0x30,%rsp
    1050:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    ptr_t Iter;
    cnt_t Count;
    cnt_t Num;
    
    /* how many digits are there? */
    if(Uint==0)
    1054:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
    1059:	75 14                	jne    106f <UVM_Print_Uint+0x2b>
    {
        UVM_Putchar('0');
    105b:	bf 30 00 00 00       	mov    $0x30,%edi
    1060:	e8 ee 0b 00 00       	call   1c53 <UVM_Putchar>
        return 1;
    1065:	b8 01 00 00 00       	mov    $0x1,%eax
    106a:	e9 98 00 00 00       	jmp    1107 <UVM_Print_Uint+0xc3>
    }
    else
    {
        /* Filter out all the zeroes */
        Count=0;
    106f:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    1076:	00 
        Iter=Uint;
    1077:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    107b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    107f:	eb 0a                	jmp    108b <UVM_Print_Uint+0x47>
        {
            Iter<<=4;
    1081:	48 c1 65 f8 04       	shlq   $0x4,-0x8(%rbp)
            Count++;
    1086:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
        while((Iter>>((sizeof(ptr_t)*8)-4))==0)
    108b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    108f:	48 c1 e8 3c          	shr    $0x3c,%rax
    1093:	48 85 c0             	test   %rax,%rax
    1096:	74 e9                	je     1081 <UVM_Print_Uint+0x3d>
        }
        /* Count is the number of pts to print */
        Count=sizeof(ptr_t)*2-Count;
    1098:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    109c:	ba 10 00 00 00       	mov    $0x10,%edx
    10a1:	48 29 c2             	sub    %rax,%rdx
    10a4:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
        Num=Count;
    10a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    10ac:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
        while(Count>0)
    10b0:	eb 4a                	jmp    10fc <UVM_Print_Uint+0xb8>
        {
            Count--;
    10b2:	48 83 6d f0 01       	subq   $0x1,-0x10(%rbp)
            Iter=(Uint>>(Count*4))&0x0F;
    10b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    10bb:	c1 e0 02             	shl    $0x2,%eax
    10be:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    10c2:	89 c1                	mov    %eax,%ecx
    10c4:	48 d3 ea             	shr    %cl,%rdx
    10c7:	48 89 d0             	mov    %rdx,%rax
    10ca:	83 e0 0f             	and    $0xf,%eax
    10cd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
            if(Iter<10)
    10d1:	48 83 7d f8 09       	cmpq   $0x9,-0x8(%rbp)
    10d6:	77 13                	ja     10eb <UVM_Print_Uint+0xa7>
                UVM_Putchar('0'+Iter);
    10d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    10dc:	83 c0 30             	add    $0x30,%eax
    10df:	0f be c0             	movsbl %al,%eax
    10e2:	89 c7                	mov    %eax,%edi
    10e4:	e8 6a 0b 00 00       	call   1c53 <UVM_Putchar>
    10e9:	eb 11                	jmp    10fc <UVM_Print_Uint+0xb8>
            else
                UVM_Putchar('A'+Iter-10);
    10eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    10ef:	83 c0 37             	add    $0x37,%eax
    10f2:	0f be c0             	movsbl %al,%eax
    10f5:	89 c7                	mov    %eax,%edi
    10f7:	e8 57 0b 00 00       	call   1c53 <UVM_Putchar>
        while(Count>0)
    10fc:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    1101:	7f af                	jg     10b2 <UVM_Print_Uint+0x6e>
        }
    }
    
    return Num;
    1103:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
}
    1107:	c9                   	leave
    1108:	c3                   	ret

0000000000001109 <UVM_Print_String>:
Input       : s8* String - The string to print.
Output      : None.
Return      : cnt_t - The length of the string printed, the '\0' is not included.
******************************************************************************/
cnt_t UVM_Print_String(s8* String)
{
    1109:	f3 0f 1e fa          	endbr64
    110d:	55                   	push   %rbp
    110e:	48 89 e5             	mov    %rsp,%rbp
    1111:	48 83 ec 20          	sub    $0x20,%rsp
    1115:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    cnt_t Count;
    
    Count=0;
    1119:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1120:	00 
    while(Count<UVM_USER_DEBUG_MAX_STR)
    1121:	eb 35                	jmp    1158 <UVM_Print_String+0x4f>
    {
        if(String[Count]=='\0')
    1123:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1127:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    112b:	48 01 d0             	add    %rdx,%rax
    112e:	0f b6 00             	movzbl (%rax),%eax
    1131:	84 c0                	test   %al,%al
    1133:	74 2c                	je     1161 <UVM_Print_String+0x58>
            break;
        
        UVM_Putchar(String[Count++]);
    1135:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1139:	48 8d 50 01          	lea    0x1(%rax),%rdx
    113d:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
    1141:	48 89 c2             	mov    %rax,%rdx
    1144:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1148:	48 01 d0             	add    %rdx,%rax
    114b:	0f b6 00             	movzbl (%rax),%eax
    114e:	0f be c0             	movsbl %al,%eax
    1151:	89 c7                	mov    %eax,%edi
    1153:	e8 fb 0a 00 00       	call   1c53 <UVM_Putchar>
    while(Count<UVM_USER_DEBUG_MAX_STR)
    1158:	48 83 7d f8 7f       	cmpq   $0x7f,-0x8(%rbp)
    115d:	7e c4                	jle    1123 <UVM_Print_String+0x1a>
    115f:	eb 01                	jmp    1162 <UVM_Print_String+0x59>
            break;
    1161:	90                   	nop
    }
    
    return Count;
    1162:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    1166:	c9                   	leave
    1167:	c3                   	ret

0000000000001168 <UVM_Captbl_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, 
                     cid_t Cap_Captbl, ptr_t Vaddr, ptr_t Entry_Num)
{
    1168:	f3 0f 1e fa          	endbr64
    116c:	55                   	push   %rbp
    116d:	48 89 e5             	mov    %rsp,%rbp
    1170:	48 83 ec 30          	sub    $0x30,%rsp
    1174:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1178:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    117c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1180:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1184:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_CRT, Cap_Captbl_Crt,
    1188:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    118c:	48 c1 e0 20          	shl    $0x20,%rax
    1190:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1194:	89 d2                	mov    %edx,%edx
    1196:	48 09 d0             	or     %rdx,%rax
    1199:	48 89 c6             	mov    %rax,%rsi
    119c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11a0:	48 ba 00 00 00 00 0a 	movabs $0xa00000000,%rdx
    11a7:	00 00 00 
    11aa:	48 09 d0             	or     %rdx,%rax
    11ad:	48 89 c7             	mov    %rax,%rdi
    11b0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    11b4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    11b8:	48 89 d1             	mov    %rdx,%rcx
    11bb:	48 89 c2             	mov    %rax,%rdx
    11be:	e8 2a ef ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Captbl),
                      Vaddr,
                      Entry_Num);
}
    11c3:	c9                   	leave
    11c4:	c3                   	ret

00000000000011c5 <UVM_Captbl_Del>:
              cid_t Cap_Del - The capability to the capability table to be deleted. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Del(cid_t Cap_Captbl_Del, cid_t Cap_Del)
{
    11c5:	f3 0f 1e fa          	endbr64
    11c9:	55                   	push   %rbp
    11ca:	48 89 e5             	mov    %rsp,%rbp
    11cd:	48 83 ec 10          	sub    $0x10,%rsp
    11d1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    11d5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_DEL, Cap_Captbl_Del,
    11d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11dd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    11e1:	48 b9 00 00 00 00 0b 	movabs $0xb00000000,%rcx
    11e8:	00 00 00 
    11eb:	48 09 ca             	or     %rcx,%rdx
    11ee:	48 89 d7             	mov    %rdx,%rdi
    11f1:	b9 00 00 00 00       	mov    $0x0,%ecx
    11f6:	ba 00 00 00 00       	mov    $0x0,%edx
    11fb:	48 89 c6             	mov    %rax,%rsi
    11fe:	e8 ea ee ff ff       	call   ed <UVM_Svc>
                      Cap_Del,
                      0,
                      0);
}
    1203:	c9                   	leave
    1204:	c3                   	ret

0000000000001205 <UVM_Captbl_Frz>:
              cid_t Cap_Frz - The cap to the kernel object being freezed. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Captbl_Frz(cid_t Cap_Captbl_Frz, cid_t Cap_Frz)
{
    1205:	f3 0f 1e fa          	endbr64
    1209:	55                   	push   %rbp
    120a:	48 89 e5             	mov    %rsp,%rbp
    120d:	48 83 ec 10          	sub    $0x10,%rsp
    1211:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1215:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
        return UVM_CAP_OP(RME_SVC_CPT_FRZ, Cap_Captbl_Frz,
    1219:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    121d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1221:	48 b9 00 00 00 00 0c 	movabs $0xc00000000,%rcx
    1228:	00 00 00 
    122b:	48 09 ca             	or     %rcx,%rdx
    122e:	48 89 d7             	mov    %rdx,%rdi
    1231:	b9 00 00 00 00       	mov    $0x0,%ecx
    1236:	ba 00 00 00 00       	mov    $0x0,%edx
    123b:	48 89 c6             	mov    %rax,%rsi
    123e:	e8 aa ee ff ff       	call   ed <UVM_Svc>
                          Cap_Frz,
                          0,
                          0);
}
    1243:	c9                   	leave
    1244:	c3                   	ret

0000000000001245 <UVM_Captbl_Add>:
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Add(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                     cid_t Cap_Captbl_Src, cid_t Cap_Src, ptr_t Flags)
{
    1245:	f3 0f 1e fa          	endbr64
    1249:	55                   	push   %rbp
    124a:	48 89 e5             	mov    %rsp,%rbp
    124d:	48 83 ec 30          	sub    $0x30,%rsp
    1251:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1255:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1259:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    125d:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1261:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    1265:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1269:	48 c1 e0 20          	shl    $0x20,%rax
    126d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    1271:	89 d2                	mov    %edx,%edx
    1273:	48 09 c2             	or     %rax,%rdx
    1276:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    127a:	48 c1 e0 20          	shl    $0x20,%rax
    127e:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    1282:	89 c9                	mov    %ecx,%ecx
    1284:	48 09 c8             	or     %rcx,%rax
    1287:	48 89 c6             	mov    %rax,%rsi
    128a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    128e:	48 89 c1             	mov    %rax,%rcx
    1291:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    1298:	00 00 00 
    129b:	48 89 c7             	mov    %rax,%rdi
    129e:	e8 4a ee ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),Flags);
}
    12a3:	c9                   	leave
    12a4:	c3                   	ret

00000000000012a5 <UVM_Captbl_Pgtbl>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Pgtbl(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                       cid_t Cap_Captbl_Src, cid_t Cap_Src,
                       ptr_t Start, ptr_t End, ptr_t Flags)
{
    12a5:	f3 0f 1e fa          	endbr64
    12a9:	55                   	push   %rbp
    12aa:	48 89 e5             	mov    %rsp,%rbp
    12ad:	48 83 ec 30          	sub    $0x30,%rsp
    12b1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    12b5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    12b9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    12bd:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    12c1:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    12c5:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    12c9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    12cd:	48 c1 e0 24          	shl    $0x24,%rax
    12d1:	48 89 c2             	mov    %rax,%rdx
    12d4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    12d8:	48 c1 e0 08          	shl    $0x8,%rax
    12dc:	48 09 d0             	or     %rdx,%rax
    12df:	48 0b 45 10          	or     0x10(%rbp),%rax
    12e3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    12e7:	48 c1 e2 20          	shl    $0x20,%rdx
    12eb:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    12ef:	89 c9                	mov    %ecx,%ecx
    12f1:	48 09 ca             	or     %rcx,%rdx
    12f4:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    12f8:	48 c1 e1 20          	shl    $0x20,%rcx
    12fc:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    1300:	89 f6                	mov    %esi,%esi
    1302:	48 09 ce             	or     %rcx,%rsi
    1305:	48 89 c1             	mov    %rax,%rcx
    1308:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    130f:	00 00 00 
    1312:	48 89 c7             	mov    %rax,%rdi
    1315:	e8 d3 ed ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_PGTBL_FLAG(End,Start,Flags));
}
    131a:	c9                   	leave
    131b:	c3                   	ret

000000000000131c <UVM_Captbl_Kern>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kern(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End)
{
    131c:	f3 0f 1e fa          	endbr64
    1320:	55                   	push   %rbp
    1321:	48 89 e5             	mov    %rsp,%rbp
    1324:	48 83 ec 30          	sub    $0x30,%rsp
    1328:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    132c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1330:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1334:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1338:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    133c:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_ADD, 0,
    1340:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1344:	48 c1 e0 20          	shl    $0x20,%rax
    1348:	48 0b 45 d8          	or     -0x28(%rbp),%rax
    134c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1350:	48 c1 e2 20          	shl    $0x20,%rdx
    1354:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    1358:	89 c9                	mov    %ecx,%ecx
    135a:	48 09 ca             	or     %rcx,%rdx
    135d:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1361:	48 c1 e1 20          	shl    $0x20,%rcx
    1365:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    1369:	89 f6                	mov    %esi,%esi
    136b:	48 09 ce             	or     %rcx,%rsi
    136e:	48 89 c1             	mov    %rax,%rcx
    1371:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    1378:	00 00 00 
    137b:	48 89 c7             	mov    %rax,%rdi
    137e:	e8 6a ed ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KERN_FLAG(End,Start));
}
    1383:	c9                   	leave
    1384:	c3                   	ret

0000000000001385 <UVM_Captbl_Kmem>:
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Kmem(cid_t Cap_Captbl_Dst, cid_t Cap_Dst, 
                      cid_t Cap_Captbl_Src, cid_t Cap_Src,
                      ptr_t Start, ptr_t End, ptr_t Flags)
{
    1385:	f3 0f 1e fa          	endbr64
    1389:	55                   	push   %rbp
    138a:	48 89 e5             	mov    %rsp,%rbp
    138d:	48 83 ec 30          	sub    $0x30,%rsp
    1391:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1395:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1399:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    139d:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    13a1:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    13a5:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(UVM_KMEM_SVC(End,RME_SVC_CPT_ADD), UVM_KMEM_CAPID(Start,Flags),
    13a9:	48 b8 00 00 00 00 ff 	movabs $0xffffffff00000000,%rax
    13b0:	ff ff ff 
    13b3:	48 23 45 d0          	and    -0x30(%rbp),%rax
    13b7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    13bb:	48 c1 ea 20          	shr    $0x20,%rdx
    13bf:	48 09 d0             	or     %rdx,%rax
    13c2:	48 89 c1             	mov    %rax,%rcx
    13c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    13c9:	48 c1 e0 20          	shl    $0x20,%rax
    13cd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    13d1:	89 d2                	mov    %edx,%edx
    13d3:	48 09 c2             	or     %rax,%rdx
    13d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    13da:	48 c1 e0 20          	shl    $0x20,%rax
    13de:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    13e2:	89 f6                	mov    %esi,%esi
    13e4:	48 09 c6             	or     %rax,%rsi
    13e7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    13eb:	48 c1 e8 06          	shr    $0x6,%rax
    13ef:	48 c1 e0 26          	shl    $0x26,%rax
    13f3:	48 89 c7             	mov    %rax,%rdi
    13f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    13fa:	48 c1 e8 06          	shr    $0x6,%rax
    13fe:	48 c1 e0 26          	shl    $0x26,%rax
    1402:	48 c1 e8 20          	shr    $0x20,%rax
    1406:	48 0b 45 10          	or     0x10(%rbp),%rax
    140a:	48 09 c7             	or     %rax,%rdi
    140d:	48 b8 00 00 00 00 0d 	movabs $0xd00000000,%rax
    1414:	00 00 00 
    1417:	48 09 f8             	or     %rdi,%rax
    141a:	48 89 c7             	mov    %rax,%rdi
    141d:	e8 cb ec ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Captbl_Dst)|UVM_PARAM_D0(Cap_Dst),
                      UVM_PARAM_D1(Cap_Captbl_Src)|UVM_PARAM_D0(Cap_Src),
                      UVM_KMEM_FLAG(End,Start));
}
    1422:	c9                   	leave
    1423:	c3                   	ret

0000000000001424 <UVM_Captbl_Rem>:
              cid_t Cap_Rem - The capability slot you want to remove. 1-Level.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Captbl_Rem(cid_t Cap_Captbl_Rem, cid_t Cap_Rem)
{
    1424:	f3 0f 1e fa          	endbr64
    1428:	55                   	push   %rbp
    1429:	48 89 e5             	mov    %rsp,%rbp
    142c:	48 83 ec 10          	sub    $0x10,%rsp
    1430:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1434:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_CPT_REM, Cap_Captbl_Rem,
    1438:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    143c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1440:	48 b9 00 00 00 00 0e 	movabs $0xe00000000,%rcx
    1447:	00 00 00 
    144a:	48 09 ca             	or     %rcx,%rdx
    144d:	48 89 d7             	mov    %rdx,%rdi
    1450:	b9 00 00 00 00       	mov    $0x0,%ecx
    1455:	ba 00 00 00 00       	mov    $0x0,%edx
    145a:	48 89 c6             	mov    %rax,%rsi
    145d:	e8 8b ec ff ff       	call   ed <UVM_Svc>
                      Cap_Rem,
                      0,
                      0);
}
    1462:	c9                   	leave
    1463:	c3                   	ret

0000000000001464 <UVM_Kern_Act>:
                      kernel function ever causes a context switch, it is responsible
                      for setting the return value. On failure, a context switch 
                      in the kernel fucntion is banned.
******************************************************************************/
ret_t UVM_Kern_Act(cid_t Cap_Kern, ptr_t Func_ID, ptr_t Sub_ID, ptr_t Param1, ptr_t Param2)
{
    1464:	f3 0f 1e fa          	endbr64
    1468:	55                   	push   %rbp
    1469:	48 89 e5             	mov    %rsp,%rbp
    146c:	48 83 ec 30          	sub    $0x30,%rsp
    1470:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1474:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1478:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    147c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1480:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_KFN, Cap_Kern,
    1484:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1488:	48 c1 e0 20          	shl    $0x20,%rax
    148c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1490:	89 d2                	mov    %edx,%edx
    1492:	48 09 d0             	or     %rdx,%rax
    1495:	48 89 c6             	mov    %rax,%rsi
    1498:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    149c:	48 ba 00 00 00 00 04 	movabs $0x400000000,%rdx
    14a3:	00 00 00 
    14a6:	48 09 d0             	or     %rdx,%rax
    14a9:	48 89 c7             	mov    %rax,%rdi
    14ac:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    14b0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    14b4:	48 89 d1             	mov    %rdx,%rcx
    14b7:	48 89 c2             	mov    %rax,%rdx
    14ba:	e8 2e ec ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Sub_ID)|UVM_PARAM_D0(Func_ID),
                      Param1,
                      Param2);
}
    14bf:	c9                   	leave
    14c0:	c3                   	ret

00000000000014c1 <UVM_Pgtbl_Crt>:
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Pgtbl, 
                    ptr_t Vaddr, ptr_t Start_Addr, ptr_t Top_Flag,
                    ptr_t Size_Order, ptr_t Num_Order)
{
    14c1:	f3 0f 1e fa          	endbr64
    14c5:	55                   	push   %rbp
    14c6:	48 89 e5             	mov    %rsp,%rbp
    14c9:	48 83 ec 30          	sub    $0x30,%rsp
    14cd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    14d1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    14d5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    14d9:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    14dd:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    14e1:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    
    return UVM_CAP_OP(UVM_PGTBL_SVC(Num_Order,RME_SVC_PGT_CRT), Cap_Captbl,
    14e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    14e9:	48 0b 45 d0          	or     -0x30(%rbp),%rax
    14ed:	48 89 c2             	mov    %rax,%rdx
    14f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    14f4:	48 c1 e0 20          	shl    $0x20,%rax
    14f8:	48 89 c1             	mov    %rax,%rcx
    14fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    14ff:	48 c1 e0 10          	shl    $0x10,%rax
    1503:	89 c0                	mov    %eax,%eax
    1505:	48 09 c1             	or     %rax,%rcx
    1508:	48 8b 45 10          	mov    0x10(%rbp),%rax
    150c:	0f b7 c0             	movzwl %ax,%eax
    150f:	48 89 ce             	mov    %rcx,%rsi
    1512:	48 09 c6             	or     %rax,%rsi
    1515:	48 8b 45 18          	mov    0x18(%rbp),%rax
    1519:	48 c1 e0 30          	shl    $0x30,%rax
    151d:	48 89 c1             	mov    %rax,%rcx
    1520:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1524:	48 09 c1             	or     %rax,%rcx
    1527:	48 b8 00 00 00 00 0f 	movabs $0xf00000000,%rax
    152e:	00 00 00 
    1531:	48 89 cf             	mov    %rcx,%rdi
    1534:	48 09 c7             	or     %rax,%rdi
    1537:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    153b:	48 89 d1             	mov    %rdx,%rcx
    153e:	48 89 c2             	mov    %rax,%rdx
    1541:	e8 a7 eb ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_Q1(Cap_Pgtbl)|UVM_PARAM_Q0(Size_Order),
                      Vaddr, 
                      Start_Addr|Top_Flag);
}
    1546:	c9                   	leave
    1547:	c3                   	ret

0000000000001548 <UVM_Pgtbl_Del>:
                                page table capability to be in. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Pgtbl_Del(cid_t Cap_Captbl, cid_t Cap_Pgtbl)
{
    1548:	f3 0f 1e fa          	endbr64
    154c:	55                   	push   %rbp
    154d:	48 89 e5             	mov    %rsp,%rbp
    1550:	48 83 ec 10          	sub    $0x10,%rsp
    1554:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1558:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DEL, Cap_Captbl,
    155c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1560:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1564:	48 b9 00 00 00 00 10 	movabs $0x1000000000,%rcx
    156b:	00 00 00 
    156e:	48 09 ca             	or     %rcx,%rdx
    1571:	48 89 d7             	mov    %rdx,%rdi
    1574:	b9 00 00 00 00       	mov    $0x0,%ecx
    1579:	ba 00 00 00 00       	mov    $0x0,%edx
    157e:	48 89 c6             	mov    %rax,%rsi
    1581:	e8 67 eb ff ff       	call   ed <UVM_Svc>
                      Cap_Pgtbl,
                      0,
                      0);
}
    1586:	c9                   	leave
    1587:	c3                   	ret

0000000000001588 <UVM_Pgtbl_Add>:
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Add(cid_t Cap_Pgtbl_Dst, ptr_t Pos_Dst, ptr_t Flags_Dst,
                    cid_t Cap_Pgtbl_Src, ptr_t Pos_Src, ptr_t Index)
{
    1588:	f3 0f 1e fa          	endbr64
    158c:	55                   	push   %rbp
    158d:	48 89 e5             	mov    %rsp,%rbp
    1590:	48 83 ec 30          	sub    $0x30,%rsp
    1594:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1598:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    159c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    15a0:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    15a4:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    15a8:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_ADD, 0,
    15ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    15b0:	48 c1 e0 20          	shl    $0x20,%rax
    15b4:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    15b8:	89 d2                	mov    %edx,%edx
    15ba:	48 09 d0             	or     %rdx,%rax
    15bd:	48 89 c1             	mov    %rax,%rcx
    15c0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    15c4:	48 c1 e0 20          	shl    $0x20,%rax
    15c8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    15cc:	89 d2                	mov    %edx,%edx
    15ce:	48 09 c2             	or     %rax,%rdx
    15d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15d5:	48 c1 e0 20          	shl    $0x20,%rax
    15d9:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
    15dd:	89 f6                	mov    %esi,%esi
    15df:	48 09 f0             	or     %rsi,%rax
    15e2:	48 89 c6             	mov    %rax,%rsi
    15e5:	48 b8 00 00 00 00 11 	movabs $0x1100000000,%rax
    15ec:	00 00 00 
    15ef:	48 89 c7             	mov    %rax,%rdi
    15f2:	e8 f6 ea ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Dst)|UVM_PARAM_D0(Pos_Dst),
                      UVM_PARAM_D1(Cap_Pgtbl_Src)|UVM_PARAM_D0(Pos_Src),
                      UVM_PARAM_D1(Flags_Dst)|UVM_PARAM_D0(Index));
}
    15f7:	c9                   	leave
    15f8:	c3                   	ret

00000000000015f9 <UVM_Pgtbl_Rem>:
              ptr_t Pos - The virtual address position to unmap from.
Output      : None.
Return      : ret_t - If the unmapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Rem(cid_t Cap_Pgtbl, ptr_t Pos)
{
    15f9:	f3 0f 1e fa          	endbr64
    15fd:	55                   	push   %rbp
    15fe:	48 89 e5             	mov    %rsp,%rbp
    1601:	48 83 ec 10          	sub    $0x10,%rsp
    1605:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1609:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_REM, 0,
    160d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1611:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1615:	b9 00 00 00 00       	mov    $0x0,%ecx
    161a:	48 89 c6             	mov    %rax,%rsi
    161d:	48 b8 00 00 00 00 12 	movabs $0x1200000000,%rax
    1624:	00 00 00 
    1627:	48 89 c7             	mov    %rax,%rdi
    162a:	e8 be ea ff ff       	call   ed <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    162f:	c9                   	leave
    1630:	c3                   	ret

0000000000001631 <UVM_Pgtbl_Con>:
              ptr_t Flags_Child - This have no effect on MPU-based architectures.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Con(cid_t Cap_Pgtbl_Parent, ptr_t Pos, cid_t Cap_Pgtbl_Child, ptr_t Flags_Child)
{
    1631:	f3 0f 1e fa          	endbr64
    1635:	55                   	push   %rbp
    1636:	48 89 e5             	mov    %rsp,%rbp
    1639:	48 83 ec 20          	sub    $0x20,%rsp
    163d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1641:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1645:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1649:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_CON, 0,
    164d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1651:	48 c1 e0 20          	shl    $0x20,%rax
    1655:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1659:	89 d2                	mov    %edx,%edx
    165b:	48 09 d0             	or     %rdx,%rax
    165e:	48 89 c6             	mov    %rax,%rsi
    1661:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    1665:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1669:	48 89 d1             	mov    %rdx,%rcx
    166c:	48 89 c2             	mov    %rax,%rdx
    166f:	48 b8 00 00 00 00 13 	movabs $0x1300000000,%rax
    1676:	00 00 00 
    1679:	48 89 c7             	mov    %rax,%rdi
    167c:	e8 6c ea ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Pgtbl_Parent)|UVM_PARAM_D0(Cap_Pgtbl_Child),
                      Pos,
                      Flags_Child);
}
    1681:	c9                   	leave
    1682:	c3                   	ret

0000000000001683 <UVM_Pgtbl_Des>:
                          table from.
Output      : None.
Return      : ret_t - If the mapping is successful, it will return 0; else error code.
******************************************************************************/
ret_t UVM_Pgtbl_Des(cid_t Cap_Pgtbl, ptr_t Pos)
{
    1683:	f3 0f 1e fa          	endbr64
    1687:	55                   	push   %rbp
    1688:	48 89 e5             	mov    %rsp,%rbp
    168b:	48 83 ec 10          	sub    $0x10,%rsp
    168f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1693:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PGT_DES, 0,
    1697:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    169b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    169f:	b9 00 00 00 00       	mov    $0x0,%ecx
    16a4:	48 89 c6             	mov    %rax,%rsi
    16a7:	48 b8 00 00 00 00 14 	movabs $0x1400000000,%rax
    16ae:	00 00 00 
    16b1:	48 89 c7             	mov    %rax,%rdi
    16b4:	e8 34 ea ff ff       	call   ed <UVM_Svc>
                      Cap_Pgtbl,
                      Pos,
                      0);
}
    16b9:	c9                   	leave
    16ba:	c3                   	ret

00000000000016bb <UVM_Proc_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Crt(cid_t Cap_Captbl_Crt, cid_t Cap_Kmem, cid_t Cap_Proc,
                   cid_t Cap_Captbl, cid_t Cap_Pgtbl, ptr_t Vaddr)
{
    16bb:	f3 0f 1e fa          	endbr64
    16bf:	55                   	push   %rbp
    16c0:	48 89 e5             	mov    %rsp,%rbp
    16c3:	48 83 ec 30          	sub    $0x30,%rsp
    16c7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    16cb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    16cf:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    16d3:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    16d7:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    16db:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CRT, Cap_Captbl_Crt,
    16df:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    16e3:	48 c1 e0 20          	shl    $0x20,%rax
    16e7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    16eb:	89 d2                	mov    %edx,%edx
    16ed:	48 09 c2             	or     %rax,%rdx
    16f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    16f4:	48 c1 e0 20          	shl    $0x20,%rax
    16f8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    16fc:	89 c9                	mov    %ecx,%ecx
    16fe:	48 09 c8             	or     %rcx,%rax
    1701:	48 89 c6             	mov    %rax,%rsi
    1704:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1708:	48 b9 00 00 00 00 15 	movabs $0x1500000000,%rcx
    170f:	00 00 00 
    1712:	48 09 c8             	or     %rcx,%rax
    1715:	48 89 c7             	mov    %rax,%rdi
    1718:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    171c:	48 89 c1             	mov    %rax,%rcx
    171f:	e8 c9 e9 ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Proc),
                      UVM_PARAM_D1(Cap_Captbl)|UVM_PARAM_D0(Cap_Pgtbl),
                      Vaddr);
}
    1724:	c9                   	leave
    1725:	c3                   	ret

0000000000001726 <UVM_Proc_Del>:
              cid_t Cap_Proc - The capability to the process. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Del(cid_t Cap_Captbl, cid_t Cap_Proc)
{
    1726:	f3 0f 1e fa          	endbr64
    172a:	55                   	push   %rbp
    172b:	48 89 e5             	mov    %rsp,%rbp
    172e:	48 83 ec 10          	sub    $0x10,%rsp
    1732:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1736:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_DEL, Cap_Captbl,
    173a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    173e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1742:	48 b9 00 00 00 00 16 	movabs $0x1600000000,%rcx
    1749:	00 00 00 
    174c:	48 09 ca             	or     %rcx,%rdx
    174f:	48 89 d7             	mov    %rdx,%rdi
    1752:	b9 00 00 00 00       	mov    $0x0,%ecx
    1757:	ba 00 00 00 00       	mov    $0x0,%edx
    175c:	48 89 c6             	mov    %rax,%rsi
    175f:	e8 89 e9 ff ff       	call   ed <UVM_Svc>
                      Cap_Proc,
                      0,
                      0);
}
    1764:	c9                   	leave
    1765:	c3                   	ret

0000000000001766 <UVM_Proc_Cpt>:
                                 this process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Cpt(cid_t Cap_Proc, cid_t Cap_Captbl)
{
    1766:	f3 0f 1e fa          	endbr64
    176a:	55                   	push   %rbp
    176b:	48 89 e5             	mov    %rsp,%rbp
    176e:	48 83 ec 10          	sub    $0x10,%rsp
    1772:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1776:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_CPT, 0,
    177a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    177e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1782:	b9 00 00 00 00       	mov    $0x0,%ecx
    1787:	48 89 c6             	mov    %rax,%rsi
    178a:	48 b8 00 00 00 00 17 	movabs $0x1700000000,%rax
    1791:	00 00 00 
    1794:	48 89 c7             	mov    %rax,%rdi
    1797:	e8 51 e9 ff ff       	call   ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Captbl,
                      0);
}
    179c:	c9                   	leave
    179d:	c3                   	ret

000000000000179e <UVM_Proc_Pgt>:
                                process. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Proc_Pgt(cid_t Cap_Proc, cid_t Cap_Pgtbl)
{
    179e:	f3 0f 1e fa          	endbr64
    17a2:	55                   	push   %rbp
    17a3:	48 89 e5             	mov    %rsp,%rbp
    17a6:	48 83 ec 10          	sub    $0x10,%rsp
    17aa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    17ae:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_PRC_PGT, 0,
    17b2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    17b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    17ba:	b9 00 00 00 00       	mov    $0x0,%ecx
    17bf:	48 89 c6             	mov    %rax,%rsi
    17c2:	48 b8 00 00 00 00 18 	movabs $0x1800000000,%rax
    17c9:	00 00 00 
    17cc:	48 89 c7             	mov    %rax,%rdi
    17cf:	e8 19 e9 ff ff       	call   ed <UVM_Svc>
                      Cap_Proc,
                      Cap_Pgtbl,
                      0);
}
    17d4:	c9                   	leave
    17d5:	c3                   	ret

00000000000017d6 <UVM_Thd_Crt>:
Output      : None.
Return      : ret_t - If successful, the Thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Thd,
                  cid_t Cap_Proc, ptr_t Max_Prio, ptr_t Vaddr)
{
    17d6:	f3 0f 1e fa          	endbr64
    17da:	55                   	push   %rbp
    17db:	48 89 e5             	mov    %rsp,%rbp
    17de:	48 83 ec 30          	sub    $0x30,%rsp
    17e2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    17e6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    17ea:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    17ee:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    17f2:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    17f6:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_CRT, Cap_Captbl, 
    17fa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    17fe:	48 c1 e0 20          	shl    $0x20,%rax
    1802:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    1806:	89 d2                	mov    %edx,%edx
    1808:	48 09 c2             	or     %rax,%rdx
    180b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    180f:	48 c1 e0 20          	shl    $0x20,%rax
    1813:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1817:	89 c9                	mov    %ecx,%ecx
    1819:	48 09 c8             	or     %rcx,%rax
    181c:	48 89 c6             	mov    %rax,%rsi
    181f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1823:	48 b9 00 00 00 00 19 	movabs $0x1900000000,%rcx
    182a:	00 00 00 
    182d:	48 09 c8             	or     %rcx,%rax
    1830:	48 89 c7             	mov    %rax,%rdi
    1833:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1837:	48 89 c1             	mov    %rax,%rcx
    183a:	e8 ae e8 ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Thd),
                      UVM_PARAM_D1(Cap_Proc)|UVM_PARAM_D0(Max_Prio),
                      Vaddr);
}
    183f:	c9                   	leave
    1840:	c3                   	ret

0000000000001841 <UVM_Thd_Del>:
              cid_t Cap_Thd - The capability to the thread in the captbl. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Del(cid_t Cap_Captbl, cid_t Cap_Thd)
{
    1841:	f3 0f 1e fa          	endbr64
    1845:	55                   	push   %rbp
    1846:	48 89 e5             	mov    %rsp,%rbp
    1849:	48 83 ec 10          	sub    $0x10,%rsp
    184d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1851:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_DEL, Cap_Captbl,
    1855:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1859:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    185d:	48 b9 00 00 00 00 1a 	movabs $0x1a00000000,%rcx
    1864:	00 00 00 
    1867:	48 09 ca             	or     %rcx,%rdx
    186a:	48 89 d7             	mov    %rdx,%rdi
    186d:	b9 00 00 00 00       	mov    $0x0,%ecx
    1872:	ba 00 00 00 00       	mov    $0x0,%edx
    1877:	48 89 c6             	mov    %rax,%rsi
    187a:	e8 6e e8 ff ff       	call   ed <UVM_Svc>
                      Cap_Thd,
                      0,
                      0);
}
    187f:	c9                   	leave
    1880:	c3                   	ret

0000000000001881 <UVM_Thd_Exec_Set>:
              ptr_t Param - The parameter of the thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Exec_Set(cid_t Cap_Thd, ptr_t Entry, ptr_t Stack, ptr_t Param)
{
    1881:	f3 0f 1e fa          	endbr64
    1885:	55                   	push   %rbp
    1886:	48 89 e5             	mov    %rsp,%rbp
    1889:	48 83 ec 20          	sub    $0x20,%rsp
    188d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1891:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1895:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1899:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, Cap_Thd,
    189d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    18a1:	48 ba 00 00 00 00 06 	movabs $0x600000000,%rdx
    18a8:	00 00 00 
    18ab:	48 09 d0             	or     %rdx,%rax
    18ae:	48 89 c7             	mov    %rax,%rdi
    18b1:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    18b5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    18b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    18bd:	48 89 c6             	mov    %rax,%rsi
    18c0:	e8 28 e8 ff ff       	call   ed <UVM_Svc>
                      Entry, 
                      Stack,
                      Param);
}
    18c5:	c9                   	leave
    18c6:	c3                   	ret

00000000000018c7 <UVM_Thd_Hyp_Set>:
                            thread's register sets.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Hyp_Set(cid_t Cap_Thd, ptr_t Kaddr)
{
    18c7:	f3 0f 1e fa          	endbr64
    18cb:	55                   	push   %rbp
    18cc:	48 89 e5             	mov    %rsp,%rbp
    18cf:	48 83 ec 10          	sub    $0x10,%rsp
    18d3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    18d7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_EXEC_SET, 0,
    18db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    18df:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    18e3:	b9 00 00 00 00       	mov    $0x0,%ecx
    18e8:	48 89 c6             	mov    %rax,%rsi
    18eb:	48 b8 00 00 00 00 06 	movabs $0x600000000,%rax
    18f2:	00 00 00 
    18f5:	48 89 c7             	mov    %rax,%rdi
    18f8:	e8 f0 e7 ff ff       	call   ed <UVM_Svc>
                      Cap_Thd,
                      Kaddr,
                      0);
}
    18fd:	c9                   	leave
    18fe:	c3                   	ret

00000000000018ff <UVM_Thd_Sched_Bind>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Bind(cid_t Cap_Thd, cid_t Cap_Thd_Sched, cid_t Cap_Sig, tid_t TID, ptr_t Prio)
{
    18ff:	f3 0f 1e fa          	endbr64
    1903:	55                   	push   %rbp
    1904:	48 89 e5             	mov    %rsp,%rbp
    1907:	48 83 ec 30          	sub    $0x30,%rsp
    190b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    190f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1913:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1917:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    191b:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_BIND, Cap_Thd,
    191f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1923:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1927:	48 c1 e2 20          	shl    $0x20,%rdx
    192b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    192f:	89 c9                	mov    %ecx,%ecx
    1931:	48 89 d6             	mov    %rdx,%rsi
    1934:	48 09 ce             	or     %rcx,%rsi
    1937:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    193b:	48 b9 00 00 00 00 1b 	movabs $0x1b00000000,%rcx
    1942:	00 00 00 
    1945:	48 89 d7             	mov    %rdx,%rdi
    1948:	48 09 cf             	or     %rcx,%rdi
    194b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    194f:	48 89 d1             	mov    %rdx,%rcx
    1952:	48 89 c2             	mov    %rax,%rdx
    1955:	e8 93 e7 ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Thd_Sched)|UVM_PARAM_D0(Cap_Sig),
                      TID, 
                      Prio);
}
    195a:	c9                   	leave
    195b:	c3                   	ret

000000000000195c <UVM_Thd_Sched_Rcv>:
                              is simply not allowed. 2-Level.
Output      : None.
Return      : ret_t - If successful, the thread ID; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Rcv(cid_t Cap_Thd)
{
    195c:	f3 0f 1e fa          	endbr64
    1960:	55                   	push   %rbp
    1961:	48 89 e5             	mov    %rsp,%rbp
    1964:	48 83 ec 10          	sub    $0x10,%rsp
    1968:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_RCV, 0,
    196c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1970:	b9 00 00 00 00       	mov    $0x0,%ecx
    1975:	ba 00 00 00 00       	mov    $0x0,%edx
    197a:	48 89 c6             	mov    %rax,%rsi
    197d:	48 b8 00 00 00 00 1c 	movabs $0x1c00000000,%rax
    1984:	00 00 00 
    1987:	48 89 c7             	mov    %rax,%rdi
    198a:	e8 5e e7 ff ff       	call   ed <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    198f:	c9                   	leave
    1990:	c3                   	ret

0000000000001991 <UVM_Thd_Sched_Prio>:
              ptr_t Prio - The priority level, higher is more critical.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Prio(cid_t Cap_Thd, ptr_t Prio)
{
    1991:	f3 0f 1e fa          	endbr64
    1995:	55                   	push   %rbp
    1996:	48 89 e5             	mov    %rsp,%rbp
    1999:	48 83 ec 10          	sub    $0x10,%rsp
    199d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    19a1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_PRIO, 0,
    19a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    19a9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    19ad:	b9 00 00 00 00       	mov    $0x0,%ecx
    19b2:	48 89 c6             	mov    %rax,%rsi
    19b5:	48 b8 00 00 00 00 07 	movabs $0x700000000,%rax
    19bc:	00 00 00 
    19bf:	48 89 c7             	mov    %rax,%rdi
    19c2:	e8 26 e7 ff ff       	call   ed <UVM_Svc>
                      Cap_Thd,
                      Prio, 
                      0);
}
    19c7:	c9                   	leave
    19c8:	c3                   	ret

00000000000019c9 <UVM_Thd_Sched_Free>:
Input       : cid_t Cap_Thd - The capability to the thread. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Sched_Free(cid_t Cap_Thd)
{
    19c9:	f3 0f 1e fa          	endbr64
    19cd:	55                   	push   %rbp
    19ce:	48 89 e5             	mov    %rsp,%rbp
    19d1:	48 83 ec 10          	sub    $0x10,%rsp
    19d5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SCHED_FREE, 0,
    19d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    19dd:	b9 00 00 00 00       	mov    $0x0,%ecx
    19e2:	ba 00 00 00 00       	mov    $0x0,%edx
    19e7:	48 89 c6             	mov    %rax,%rsi
    19ea:	48 b8 00 00 00 00 05 	movabs $0x500000000,%rax
    19f1:	00 00 00 
    19f4:	48 89 c7             	mov    %rax,%rdi
    19f7:	e8 f1 e6 ff ff       	call   ed <UVM_Svc>
                      Cap_Thd,
                      0, 
                      0);
}
    19fc:	c9                   	leave
    19fd:	c3                   	ret

00000000000019fe <UVM_Thd_Time_Xfer>:
                           order of 100us or 1ms.
Output      : None.
Return      : ret_t - If successful, the destination time amount; or an error code.
******************************************************************************/
ret_t UVM_Thd_Time_Xfer(cid_t Cap_Thd_Dst, cid_t Cap_Thd_Src, ptr_t Time)
{
    19fe:	f3 0f 1e fa          	endbr64
    1a02:	55                   	push   %rbp
    1a03:	48 89 e5             	mov    %rsp,%rbp
    1a06:	48 83 ec 20          	sub    $0x20,%rsp
    1a0a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1a0e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1a12:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_TIME_XFER, 0,
    1a16:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1a1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a1e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1a22:	48 89 c6             	mov    %rax,%rsi
    1a25:	48 b8 00 00 00 00 08 	movabs $0x800000000,%rax
    1a2c:	00 00 00 
    1a2f:	48 89 c7             	mov    %rax,%rdi
    1a32:	e8 b6 e6 ff ff       	call   ed <UVM_Svc>
                      Cap_Thd_Dst,
                      Cap_Thd_Src, 
                      Time);
}
    1a37:	c9                   	leave
    1a38:	c3                   	ret

0000000000001a39 <UVM_Thd_Swt>:
                                 this thread.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Thd_Swt(cid_t Cap_Thd, ptr_t Full_Yield)
{
    1a39:	f3 0f 1e fa          	endbr64
    1a3d:	55                   	push   %rbp
    1a3e:	48 89 e5             	mov    %rsp,%rbp
    1a41:	48 83 ec 10          	sub    $0x10,%rsp
    1a45:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1a49:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_THD_SWT, 0,
    1a4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1a51:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1a55:	b9 00 00 00 00       	mov    $0x0,%ecx
    1a5a:	48 89 c6             	mov    %rax,%rsi
    1a5d:	48 b8 00 00 00 00 09 	movabs $0x900000000,%rax
    1a64:	00 00 00 
    1a67:	48 89 c7             	mov    %rax,%rdi
    1a6a:	e8 7e e6 ff ff       	call   ed <UVM_Svc>
                      Cap_Thd,
                      Full_Yield, 
                      0);
}
    1a6f:	c9                   	leave
    1a70:	c3                   	ret

0000000000001a71 <UVM_Sig_Crt>:
                            within the kernel virtual address.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, cid_t Cap_Sig, ptr_t Vaddr)
{
    1a71:	f3 0f 1e fa          	endbr64
    1a75:	55                   	push   %rbp
    1a76:	48 89 e5             	mov    %rsp,%rbp
    1a79:	48 83 ec 20          	sub    $0x20,%rsp
    1a7d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1a81:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1a85:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1a89:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_CRT, Cap_Captbl,
    1a8d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1a91:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1a95:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    1a99:	48 be 00 00 00 00 1d 	movabs $0x1d00000000,%rsi
    1aa0:	00 00 00 
    1aa3:	48 89 cf             	mov    %rcx,%rdi
    1aa6:	48 09 f7             	or     %rsi,%rdi
    1aa9:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    1aad:	48 89 c6             	mov    %rax,%rsi
    1ab0:	e8 38 e6 ff ff       	call   ed <UVM_Svc>
                      Cap_Kmem,
                      Cap_Sig, 
                      Vaddr);
}
    1ab5:	c9                   	leave
    1ab6:	c3                   	ret

0000000000001ab7 <UVM_Sig_Del>:
              cid_t Cap_Sig - The capability to the signal. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Sig_Del(cid_t Cap_Captbl, cid_t Cap_Sig)
{
    1ab7:	f3 0f 1e fa          	endbr64
    1abb:	55                   	push   %rbp
    1abc:	48 89 e5             	mov    %rsp,%rbp
    1abf:	48 83 ec 10          	sub    $0x10,%rsp
    1ac3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1ac7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_DEL, Cap_Captbl,
    1acb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1acf:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1ad3:	48 b9 00 00 00 00 1e 	movabs $0x1e00000000,%rcx
    1ada:	00 00 00 
    1add:	48 09 ca             	or     %rcx,%rdx
    1ae0:	48 89 d7             	mov    %rdx,%rdi
    1ae3:	b9 00 00 00 00       	mov    $0x0,%ecx
    1ae8:	ba 00 00 00 00       	mov    $0x0,%edx
    1aed:	48 89 c6             	mov    %rax,%rsi
    1af0:	e8 f8 e5 ff ff       	call   ed <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    1af5:	c9                   	leave
    1af6:	c3                   	ret

0000000000001af7 <UVM_Sig_Snd>:
Input       : cid_t Cap_Sig - The capability to the signal. 2-Level.
Output      : None.
Return      : ret_t - If successful, 0, or an error code.
******************************************************************************/
ret_t UVM_Sig_Snd(cid_t Cap_Sig)
{
    1af7:	f3 0f 1e fa          	endbr64
    1afb:	55                   	push   %rbp
    1afc:	48 89 e5             	mov    %rsp,%rbp
    1aff:	48 83 ec 10          	sub    $0x10,%rsp
    1b03:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_SND, 0,
    1b07:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1b0b:	b9 00 00 00 00       	mov    $0x0,%ecx
    1b10:	ba 00 00 00 00       	mov    $0x0,%edx
    1b15:	48 89 c6             	mov    %rax,%rsi
    1b18:	48 b8 00 00 00 00 02 	movabs $0x200000000,%rax
    1b1f:	00 00 00 
    1b22:	48 89 c7             	mov    %rax,%rdi
    1b25:	e8 c3 e5 ff ff       	call   ed <UVM_Svc>
                      Cap_Sig,
                      0, 
                      0);
}
    1b2a:	c9                   	leave
    1b2b:	c3                   	ret

0000000000001b2c <UVM_Sig_Rcv>:
Output      : None.
Return      : ret_t - If successful, a non-negative number containing the number of signals
                      received will be returned; else an error code.
******************************************************************************/
ret_t UVM_Sig_Rcv(cid_t Cap_Sig, ptr_t Option)
{
    1b2c:	f3 0f 1e fa          	endbr64
    1b30:	55                   	push   %rbp
    1b31:	48 89 e5             	mov    %rsp,%rbp
    1b34:	48 83 ec 10          	sub    $0x10,%rsp
    1b38:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1b3c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_SIG_RCV, 0,
    1b40:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1b44:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1b48:	b9 00 00 00 00       	mov    $0x0,%ecx
    1b4d:	48 89 c6             	mov    %rax,%rsi
    1b50:	48 b8 00 00 00 00 03 	movabs $0x300000000,%rax
    1b57:	00 00 00 
    1b5a:	48 89 c7             	mov    %rax,%rdi
    1b5d:	e8 8b e5 ff ff       	call   ed <UVM_Svc>
                      Cap_Sig,
                      Option, 
                      0);
}
    1b62:	c9                   	leave
    1b63:	c3                   	ret

0000000000001b64 <UVM_Inv_Crt>:
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Crt(cid_t Cap_Captbl, cid_t Cap_Kmem, 
                  cid_t Cap_Inv, cid_t Cap_Proc, ptr_t Vaddr)
{
    1b64:	f3 0f 1e fa          	endbr64
    1b68:	55                   	push   %rbp
    1b69:	48 89 e5             	mov    %rsp,%rbp
    1b6c:	48 83 ec 30          	sub    $0x30,%rsp
    1b70:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1b74:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1b78:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1b7c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    1b80:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_CRT, Cap_Captbl,
    1b84:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1b88:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    1b8c:	48 c1 e2 20          	shl    $0x20,%rdx
    1b90:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1b94:	89 c9                	mov    %ecx,%ecx
    1b96:	48 89 d6             	mov    %rdx,%rsi
    1b99:	48 09 ce             	or     %rcx,%rsi
    1b9c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1ba0:	48 b9 00 00 00 00 1f 	movabs $0x1f00000000,%rcx
    1ba7:	00 00 00 
    1baa:	48 89 d7             	mov    %rdx,%rdi
    1bad:	48 09 cf             	or     %rcx,%rdi
    1bb0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    1bb4:	48 89 d1             	mov    %rdx,%rcx
    1bb7:	48 89 c2             	mov    %rax,%rdx
    1bba:	e8 2e e5 ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Cap_Kmem)|UVM_PARAM_D0(Cap_Inv),
                      Cap_Proc, 
                      Vaddr);
}
    1bbf:	c9                   	leave
    1bc0:	c3                   	ret

0000000000001bc1 <UVM_Inv_Del>:
              cid_t Cap_Inv - The capability to the invocation stub. 1-Level.
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Del(cid_t Cap_Captbl, cid_t Cap_Inv)
{
    1bc1:	f3 0f 1e fa          	endbr64
    1bc5:	55                   	push   %rbp
    1bc6:	48 89 e5             	mov    %rsp,%rbp
    1bc9:	48 83 ec 10          	sub    $0x10,%rsp
    1bcd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1bd1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_DEL, Cap_Captbl,
    1bd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1bd9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1bdd:	48 b9 00 00 00 00 20 	movabs $0x2000000000,%rcx
    1be4:	00 00 00 
    1be7:	48 09 ca             	or     %rcx,%rdx
    1bea:	48 89 d7             	mov    %rdx,%rdi
    1bed:	b9 00 00 00 00       	mov    $0x0,%ecx
    1bf2:	ba 00 00 00 00       	mov    $0x0,%edx
    1bf7:	48 89 c6             	mov    %rax,%rsi
    1bfa:	e8 ee e4 ff ff       	call   ed <UVM_Svc>
                      Cap_Inv,
                      0, 
                      0);
}
    1bff:	c9                   	leave
    1c00:	c3                   	ret

0000000000001c01 <UVM_Inv_Set>:
                                     immediately, or we wait for fault handling?
Output      : None.
Return      : ret_t - If successful, 0; or an error code.
******************************************************************************/
ret_t UVM_Inv_Set(cid_t Cap_Inv, ptr_t Entry, ptr_t Stack, ptr_t Fault_Ret_Flag)
{
    1c01:	f3 0f 1e fa          	endbr64
    1c05:	55                   	push   %rbp
    1c06:	48 89 e5             	mov    %rsp,%rbp
    1c09:	48 83 ec 20          	sub    $0x20,%rsp
    1c0d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1c11:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    1c15:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
    1c19:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
    return UVM_CAP_OP(RME_SVC_INV_SET, 0,
    1c1d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1c21:	48 c1 e0 20          	shl    $0x20,%rax
    1c25:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1c29:	89 d2                	mov    %edx,%edx
    1c2b:	48 09 d0             	or     %rdx,%rax
    1c2e:	48 89 c6             	mov    %rax,%rsi
    1c31:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1c35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1c39:	48 89 d1             	mov    %rdx,%rcx
    1c3c:	48 89 c2             	mov    %rax,%rdx
    1c3f:	48 b8 00 00 00 00 21 	movabs $0x2100000000,%rax
    1c46:	00 00 00 
    1c49:	48 89 c7             	mov    %rax,%rdi
    1c4c:	e8 9c e4 ff ff       	call   ed <UVM_Svc>
                      UVM_PARAM_D1(Fault_Ret_Flag)|UVM_PARAM_D0(Cap_Inv),
                      Entry, 
                      Stack);
}
    1c51:	c9                   	leave
    1c52:	c3                   	ret

0000000000001c53 <UVM_Putchar>:
Input       : char Char - The character to print.
Output      : None.
Return      : ptr_t - Always 0.
******************************************************************************/
ptr_t UVM_Putchar(char Char)
{
    1c53:	f3 0f 1e fa          	endbr64
    1c57:	55                   	push   %rbp
    1c58:	48 89 e5             	mov    %rsp,%rbp
    1c5b:	48 83 ec 10          	sub    $0x10,%rsp
    1c5f:	89 f8                	mov    %edi,%eax
    1c61:	88 45 fc             	mov    %al,-0x4(%rbp)
    /* Wait until we have transmitted */
    while((__UVM_X64_In(UVM_X64_COM1+5)&0x20)==0);
    1c64:	90                   	nop
    1c65:	bf fd 03 00 00       	mov    $0x3fd,%edi
    1c6a:	e8 96 e3 ff ff       	call   5 <__UVM_X64_In>
    1c6f:	83 e0 20             	and    $0x20,%eax
    1c72:	48 85 c0             	test   %rax,%rax
    1c75:	74 ee                	je     1c65 <UVM_Putchar+0x12>

    __UVM_X64_Out(UVM_X64_COM1, Char);
    1c77:	48 0f be 45 fc       	movsbq -0x4(%rbp),%rax
    1c7c:	48 89 c6             	mov    %rax,%rsi
    1c7f:	bf f8 03 00 00       	mov    $0x3f8,%edi
    1c84:	e8 86 e3 ff ff       	call   f <__UVM_X64_Out>

    return 0;
    1c89:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1c8e:	c9                   	leave
    1c8f:	c3                   	ret

0000000000001c90 <_UVM_Stack_Init>:
Output      : None.
Return      : ptr_t - The actual stack address to use for system call.
******************************************************************************/
ptr_t _UVM_Stack_Init(ptr_t Stack, ptr_t Size, ptr_t Stub, ptr_t Entry,
                      ptr_t Param1, ptr_t Param2, ptr_t Param3, ptr_t Param4)
{
    1c90:	f3 0f 1e fa          	endbr64
    1c94:	55                   	push   %rbp
    1c95:	48 89 e5             	mov    %rsp,%rbp
    1c98:	48 83 ec 40          	sub    $0x40,%rsp
    1c9c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1ca0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    1ca4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    1ca8:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
    1cac:	4c 89 45 c8          	mov    %r8,-0x38(%rbp)
    1cb0:	4c 89 4d c0          	mov    %r9,-0x40(%rbp)
	ptr_t* Stack_Ptr;

    Stack_Ptr=(ptr_t*)(Stack+Size-UVM_STACK_SAFE_SIZE*sizeof(ptr_t));
    1cb4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1cb8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1cbc:	48 01 d0             	add    %rdx,%rax
    1cbf:	48 2d 00 01 00 00    	sub    $0x100,%rax
    1cc5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    Stack_Ptr[0]=Param1;
    1cc9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ccd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    1cd1:	48 89 10             	mov    %rdx,(%rax)
    Stack_Ptr[1]=Param2;
    1cd4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1cd8:	48 8d 50 08          	lea    0x8(%rax),%rdx
    1cdc:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1ce0:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[2]=Param3;
    1ce3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1ce7:	48 8d 50 10          	lea    0x10(%rax),%rdx
    1ceb:	48 8b 45 10          	mov    0x10(%rbp),%rax
    1cef:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[3]=Param4;
    1cf2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1cf6:	48 8d 50 18          	lea    0x18(%rax),%rdx
    1cfa:	48 8b 45 18          	mov    0x18(%rbp),%rax
    1cfe:	48 89 02             	mov    %rax,(%rdx)
    Stack_Ptr[4]=Entry;
    1d01:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1d05:	48 8d 50 20          	lea    0x20(%rax),%rdx
    1d09:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1d0d:	48 89 02             	mov    %rax,(%rdx)

    return (ptr_t)Stack_Ptr;
    1d10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
}
    1d14:	c9                   	leave
    1d15:	c3                   	ret

0000000000001d16 <_UVM_Idle>:
Input       : None.
Output      : None.
Return      : None.
******************************************************************************/
void _UVM_Idle(void)
{
    1d16:	f3 0f 1e fa          	endbr64
    1d1a:	55                   	push   %rbp
    1d1b:	48 89 e5             	mov    %rsp,%rbp
    /* Do nothing. In the future we may call a kernel function to put us to sleep */
}
    1d1e:	90                   	nop
    1d1f:	5d                   	pop    %rbp
    1d20:	c3                   	ret

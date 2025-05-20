/******************************************************************************
Filename    : init.c
Author      : pry
Date        : 11/06/2017
Licence     : LGPL v3+; see COPYING for details.
Description : The init process of MMU-based UVM systems. This process is currently
              just a benchmark, and will only output the performance figures. The kernel
              is not responsible for parsing the .elf files, so the header of this file is
              pretty much fixed.
******************************************************************************/

/* Includes ******************************************************************/
#include "rme.h"

#define __HDR_DEFS__
#include "Platform/UVM_platform.h"
#include "Init/syssvc.h"
#include "Init/init.h"
#undef __HDR_DEFS__

#define __HDR_STRUCTS__
#include "Platform/UVM_platform.h"
#include "Init/syssvc.h"
#include "Init/init.h"
#undef __HDR_STRUCTS__

/* Private include */
#include "Init/init.h"

#define __HDR_PUBLIC_MEMBERS__
#include "Platform/UVM_platform.h"
#include "Init/syssvc.h"
#undef __HDR_PUBLIC_MEMBERS__
/* End Includes **************************************************************/

/* Begin Function:UVM_Clear ***************************************************
Description : Memset a memory area to zero.
Input       : void* Addr - The address to clear.
              ptr_t Size - The size to clear.
Output      : None.
Return      : None.
******************************************************************************/
void UVM_Clear(void* Addr, ptr_t Size)
{
    ptr_t* Word_Inc;
    u8* Byte_Inc;
    ptr_t Words;
    ptr_t Bytes;
    
    /* On processors not that fast, copy by word is really important */
    Word_Inc=(ptr_t*)Addr;
    for(Words=Size/sizeof(ptr_t);Words>0;Words--)
    {
        *Word_Inc=0;
        Word_Inc++;
    }
    
    /* Get the final bytes */
    Byte_Inc=(u8*)Word_Inc;
    for(Bytes=Size%sizeof(ptr_t);Bytes>0;Bytes--)
    {
        *Byte_Inc=0;
        Byte_Inc++;
    }
}
/* End Function:UVM_Clear ****************************************************/

#define TEST_THD1        9
#define TEST_THD2        10
#define TEST_INV1        11
#define TEST_SIG1        12
#define TEST_PROC_CAPTBL  13
#define TEST_PROCESS_PGT  14
#define TEST_PROCESS      15

/*The test process page table slot*/
#define TEST_PROCESS_PML4   0
#define RME_TEST_PDP(X)      (TEST_PROCESS_PML4+1+(X))
#define RME_TEST_PDE(X)      (RME_TEST_PDP(16)+(X))

volatile ptr_t start;
volatile ptr_t middle;
volatile ptr_t end;
ptr_t sum;
ptr_t sumin;
ptr_t sumout;

void TEST_THD1_FUNC(void)
{
    cnt_t Count;
    sum=0;

    for(Count=0;Count<1000000;Count++)
    {
        start=__UVM_X64_Read_TSC();
        UVM_Thd_Swt(TEST_THD2,0);
        end=__UVM_X64_Read_TSC();
        sum+=end-start;
    }
    UVM_LOG_S("\r\nThread Switching takes clock cycles:");
    UVM_LOG_I(sum/1000000);
}

void TEST_THD2_FUNC(void)
{
    while(1)
    {
        UVM_Thd_Swt(TEST_THD1,0);
    }
}

void TEST_INV1_FUNC(ptr_t param)
{
    middle=__UVM_X64_Read_TSC();
    UVM_Inv_Ret(param);
}

/* Begin Function:main ********************************************************
Description : The entry of the VMM's init thread. 
Input       : None.
Output      : None.
Return      : int - This function shall never return.
******************************************************************************/
int main(ptr_t CPUID)
{
    ptr_t Cur_Addr;
    cnt_t Count;
    cnt_t Count1;
    cnt_t Count2;
    ptr_t TEST_INV_STACK[2048];
    UVM_LOG_S("\r\nEnter user mode success!Welcome to RME system!");
    UVM_LOG_S("\r\nNow we are running init thread on cpu:");
    UVM_LOG_I(CPUID);
    if(CPUID==0) {
        /*Empty test begins here*/
        sum=0;
        for(Count=0;Count<1000000;Count++)
        {
            start=__UVM_X64_Read_TSC();
            end=__UVM_X64_Read_TSC();
            sum+=end-start;
        }
        UVM_LOG_S("\r\nEmpty test takes clock cycles:");
        UVM_LOG_I(sum/1000000);
        /*Empty test ends here*/

        /*Empty system call test begins here*/
        sum=0;
        for(Count=0;Count<1000000;Count++)
        {
            start=__UVM_X64_Read_TSC();
            UVM_Svc(-1,-1,-1,-1);
            end=__UVM_X64_Read_TSC();
            sum+=end-start;
        }
        UVM_LOG_S("\r\nEmpty system call takes clock cycles:");
        UVM_LOG_I(sum/1000000);
        /*Empty system call test ends here*/

        /*Now we begin to place kernel objects at this address,It must be a relative address*/
        Cur_Addr=0xFFFF800010000000ULL-0xFFFF800001600000ULL;

        /*/*Thread switching test begins here#1#
        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD1,TEST_THD1_FUNC,12*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
        Cur_Addr+=UVM_THD_SIZE;

        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD2,TEST_THD2_FUNC,13*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,1)>=0);
        Cur_Addr+=UVM_THD_SIZE;

        UVM_Thd_Swt(TEST_THD1,0);
        UVM_LOG_S("\r\nExit THD1!");
        /*Thread switching test ends here#1#*/

        /*Signal send test begins here*/
        UVM_ASSERT(UVM_Sig_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_SIG1, Cur_Addr)>=0);
        Cur_Addr+=UVM_SIG_SIZE;
        sum=0;
        for(Count=0;Count<1000000;Count++)
        {
            start=__UVM_X64_Read_TSC();
            UVM_Sig_Snd(TEST_SIG1);
            end=__UVM_X64_Read_TSC();
            sum+=end-start;
        }
        UVM_LOG_S("\r\nSignal send takes clock cycles:");
        UVM_LOG_I(sum/1000000);
        /*Signal send test ends here*/


        /*Invocation stub test begins here*/
        /*Create test process capability table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROC_CAPTBL,Cur_Addr,16)>=0);
        Cur_Addr+=UVM_CAPTBL_SIZE(16);
        /*Create test process page table*/
        UVM_ASSERT(UVM_Captbl_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PGT,Cur_Addr,1+16+8192)>=0);
        Cur_Addr+=UVM_CAPTBL_SIZE(1+16+8192);
        /*Create test process PML4*/
        Cur_Addr+=UVM_ROUND_UP(Cur_Addr,12);
        UVM_ASSERT(UVM_Pgtbl_Crt(TEST_PROCESS_PGT,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS_PML4,Cur_Addr,0,1U,RME_PGT_SIZE_512G,RME_PGT_NUM_512)>=0);
        Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
        Cur_Addr+=UVM_ROUND_UP(Cur_Addr,12);
        /* Create 16 PDPs*/
        for(Count=0;Count<16;Count++)
        {
            UVM_ASSERT(UVM_Pgtbl_Crt(TEST_PROCESS_PGT, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), RME_TEST_PDP(Count),
                                           Cur_Addr, 0, 0U, RME_PGT_SIZE_1G, RME_PGT_NUM_512)>=0);
            Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
            UVM_ASSERT(UVM_Pgtbl_Con(UVM_CAPID(TEST_PROCESS_PGT,TEST_PROCESS_PML4),Count,
                                                UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDP(Count)),RME_PGT_ALL_PERM)>=0);
        }

        /* Create 8192 PDEs*/
        for(Count=0;Count<8192;Count++)
        {
            UVM_ASSERT(UVM_Pgtbl_Crt(TEST_PROCESS_PGT, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), RME_TEST_PDE(Count),
                                           Cur_Addr, 0, 0U,  RME_PGT_SIZE_2M, RME_PGT_NUM_512)>=0);
            Cur_Addr+=UVM_PGTBL_SIZE_NOM(RME_PGT_NUM_512);
            UVM_ASSERT(UVM_Pgtbl_Con(UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDP(Count>>9)),Count&0x1FF,
                                       UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDE(Count)),RME_PGT_ALL_PERM)>=0);
        }
        /*Add pages to PDEs*/
        for (Count1=0;Count1<8192;Count1++)
        {
            for (Count2=0;Count2<512;Count2++)
            {
                UVM_ASSERT(UVM_Pgtbl_Add(UVM_CAPID(TEST_PROCESS_PGT,RME_TEST_PDE(Count1)),Count2,0,
                                    UVM_CAPID(UVM_BOOT_TBL_PGTBL,RME_TEST_PDE(Count1)),Count2,0)>=0);
            }
        }
        /*Now we create the test process*/
        UVM_ASSERT(UVM_Proc_Crt(UVM_BOOT_CAPTBL,UVM_CAPID(UVM_BOOT_TBL_KMEM,0),TEST_PROCESS,UVM_BOOT_CAPTBL,
                                                UVM_CAPID(TEST_PROCESS_PGT,TEST_PROCESS_PML4),Cur_Addr)>=0);
        Cur_Addr+=UVM_PROC_SIZE;

        /*create the test invacation stub */
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, UVM_BOOT_INIT_PROC, Cur_Addr)>=0);
        UVM_LOG_S("\r\nSuccess!!!!");
        Cur_Addr+=UVM_INV_SIZE;
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1, TEST_INV1_FUNC,TEST_INV_STACK,0)>=0);
        UVM_LOG_S("\r\nSuccess!!!!");
        sum=0;
        sumin=0;
        sumout=0;
        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
        {
            start=__UVM_X64_Read_TSC();
            UVM_LOG_S("\r\nCount:");
            UVM_LOG_I(Count);
            UVM_Inv_Act(TEST_INV1,0,0);
            end=__UVM_X64_Read_TSC();
            sum+=end-start;
            sumin+=middle-start;
            sumout+=end-middle;
        }
        UVM_LOG_S("\r\ninv");
        UVM_LOG_I(sum/1000000);
        UVM_LOG_S("\r\nin");
        UVM_LOG_I(sumin/1000000);
        UVM_LOG_S("\r\nout");
        UVM_LOG_I(sumout/1000000);

        /*Invocation stub test ends here*/
        while (1){}
        /*Cross-process thread switching test begins here*/
        /*create thread*/
        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD1,TEST_THD1_FUNC,12*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,0)>=0);
        Cur_Addr+=UVM_THD_SIZE;

        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD2,TEST_THD2_FUNC,13*UVM_POW2(RME_PGT_SIZE_1M)+0x20000000ULL,1)>=0);
        Cur_Addr+=UVM_THD_SIZE;

        UVM_LOG_S("\r\ndwadadawdadd");
        UVM_Thd_Swt(TEST_THD1,0);

        /*Cross-process thread switching test ends here*/
        while (1);/*Idle*/
    }
}
/* End Function:main *********************************************************/

/* End Of File ***************************************************************/

/* Copyright (C) Evo-Devo Instrum. All rights reserved ***********************/

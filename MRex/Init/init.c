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

/* place the stack at 12MB. this must be fine */
#define TEST_THD1        9
#define TEST_THD2        10
#define TEST_INV1        11

volatile ptr_t start;
volatile ptr_t middle;
volatile ptr_t end;
ptr_t sum;
ptr_t sumin;
ptr_t sumout;

void test(void)
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

    UVM_LOG_S("\r\nswtch ");
    UVM_LOG_I(sum/1000000);
    UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*8, sum/1000000, 0);
    while(1);
}

void test2(void)
{
    while(1)
    {
        UVM_Thd_Swt(TEST_THD1,0);
    }
}

void sinvtest(ptr_t Param)
{
    middle=__UVM_X64_Read_TSC();
    UVM_Svc(0,0,0,0);
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

    UVM_LOG_I(CPUID);
    /* We only print information on the first CPU */
    if(CPUID==0)
    {
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0, 1234, 0);
/*
        UVM_LOG_S("\r\n\r\n-------------------------------------------------------------------------------\r\n");
        UVM_LOG_S("                               Welcome to the\r\n");
        UVM_LOG_S("\r\n");
        UVM_LOG_S("                        ######    ###  ###  ########\r\n");
        UVM_LOG_S("                        #######   ###  ###  ########\r\n");
        UVM_LOG_S("                        ##    ##  ###  ###  ##\r\n");
        UVM_LOG_S("                        ##    ##  ###  ###  ##\r\n");
        UVM_LOG_S("                        ##    ##  ## ## ##  ##\r\n");
        UVM_LOG_S("                        #######   ## ## ##  #######\r\n");
        UVM_LOG_S("                        ######    ## ## ##  #######\r\n");
        UVM_LOG_S("                        ##   ##   ## ## ##  ##\r\n");
        UVM_LOG_S("                        ##   ##   ##    ##  ##\r\n");
        UVM_LOG_S("                        ##    ##  ##    ##  ##\r\n");
        UVM_LOG_S("                        ##    ##  ##    ##  ########\r\n");
        UVM_LOG_S("                        ##    ### ##    ##  ########\r\n");
        UVM_LOG_S("\r\n");
        UVM_LOG_S("                  Application Processor User-level Platform!\r\n");
        UVM_LOG_S("-------------------------------------------------------------------------------\r\n");
    UVM_LOG_U(__UVM_X64_Read_TSC());
    UVM_LOG_U(__UVM_X64_Read_TSC());*/
        sum=0;

        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
        {
            start=__UVM_X64_Read_TSC();
            end=__UVM_X64_Read_TSC();
            sum+=end-start;
        }
        UVM_LOG_S("\r\nempty");
        UVM_LOG_I(sum/1000000);
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0, sum/1000000, 0);

        sum=0;

        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
        {
            start=__UVM_X64_Read_TSC();
            UVM_Svc(-1,-1,-1,-1);
            end=__UVM_X64_Read_TSC();
            sum+=end-start;
        }
        UVM_LOG_S("\r\nraw");
        UVM_LOG_I(sum/1000000);
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*2, sum/1000000, 0);

        Cur_Addr=0xFFFF800010000000ULL;//0xFFFF800007000000ULL on phani
        /* We create this in Kmem1 */
        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD1, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD1,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD1,test,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);

        Cur_Addr+=UVM_THD_SIZE;
        UVM_ASSERT(UVM_Thd_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_THD2, UVM_BOOT_INIT_PROC, 10, Cur_Addr)>=0);
        UVM_ASSERT(UVM_Thd_Sched_Bind(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_CAPID_NULL,0,0)>=0);
        UVM_ASSERT(UVM_Thd_Time_Xfer(TEST_THD2,UVM_CAPID(UVM_BOOT_TBL_THD,0),UVM_THD_INF_TIME)>=0);
        UVM_ASSERT(UVM_Thd_Exec_Set(TEST_THD2,test2,13*UVM_POW2(RME_PGT_SIZE_1M),1)>=0);

        UVM_Thd_Swt(TEST_THD1,0);
        UVM_LOG_S("\r\nShould not get here");
        while(1);
        UVM_ASSERT(UVM_Inv_Crt(UVM_BOOT_CAPTBL, UVM_CAPID(UVM_BOOT_TBL_KMEM,0), TEST_INV1, UVM_BOOT_INIT_PROC, Cur_Addr)>=0);
        Cur_Addr+=UVM_INV_SIZE;
        UVM_ASSERT(UVM_Inv_Set(TEST_INV1, sinvtest,12*UVM_POW2(RME_PGT_SIZE_1M),0)>=0);

        sum=0;
        sumin=0;
        sumout=0;
        /* Run a raw test before we run anything else */
        for(Count=0;Count<1000000;Count++)
        {
            start=__UVM_X64_Read_TSC();
            UVM_Inv_Act(TEST_INV1,0,0);
            end=__UVM_X64_Read_TSC();
            sum+=end-start;
            sumin+=middle-start;
            sumout+=end-middle;
        }
        UVM_LOG_S("\r\ninv");
        UVM_LOG_I(sum/1000000);
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*3, sum/1000000, 0);
        UVM_LOG_S("\r\nin");
        UVM_LOG_I(sumin/1000000);
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*4, sumin/1000000, 0);
        UVM_LOG_S("\r\nout");
        UVM_LOG_I(sumout/1000000);
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*5, sumout/1000000, 0);

        /* Stub test */
        sum=0;
        for(Count=0;Count<1000000;Count++)
        {
            start=__UVM_X64_Read_TSC();
            UVM_Inv_Act_Dummy(TEST_INV1,0,0);
            end=__UVM_X64_Read_TSC();
            sum+=end-start;
        }
        UVM_LOG_S("\r\ninv-dummy");
        UVM_LOG_I(sum/1000000);
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*6, sum/1000000, 0);

        /* crazyopt test - single callq/retq */
        sum=0;
        for(Count=0;Count<1000000;Count++)
        {
            start=__UVM_X64_Read_TSC();
            UVM_cret(0,0);
            end=__UVM_X64_Read_TSC();
            sum+=end-start;
        }
        UVM_LOG_S("\r\ncallret");
        UVM_LOG_I(sum/(1000000/10));
        UVM_Kern_Act(UVM_BOOT_INIT_KERN, 0x07, 0xa0*7, sum/1000000, 0);

    }
    /* Run some simple benchmarks *//*
core-local ctxsw wrt.cores
core-local IPC wrt.cores
map/unmap pages wrt.cores
WCIRT*/

    while(1);
    
    while(1)
    {
        /* Receive the scheduler notifications for the interrupt threads. If any of
         * them failed, then we just panic, because none of them are supposed to fail. */
        /* UVM_LOG_S("I"); */
        UVM_Idle();
    }
}
/* End Function:main *********************************************************/

/* End Of File ***************************************************************/

/* Copyright (C) Evo-Devo Instrum. All rights reserved ***********************/

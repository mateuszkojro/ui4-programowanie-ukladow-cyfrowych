/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/mateu/LinearFeedbackShiftRegister/LFSR.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_2704071536_3212880686_p_0(char *t0)
{
    char t28[16];
    char t30[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned char t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned char t22;
    unsigned char t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t29;
    char *t31;
    char *t32;
    int t33;
    unsigned int t34;
    unsigned char t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;

LAB0:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 2832);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 4526);
    t6 = (t0 + 2912);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 10U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1352U);
    t6 = *((char **)t2);
    t13 = (8 - 9);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t2 = (t6 + t16);
    t17 = *((unsigned char *)t2);
    t7 = (t0 + 1352U);
    t8 = *((char **)t7);
    t18 = (9 - 9);
    t19 = (t18 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t7 = (t8 + t21);
    t22 = *((unsigned char *)t7);
    t23 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t17, t22);
    t9 = (t0 + 1352U);
    t10 = *((char **)t9);
    t24 = (9 - 9);
    t25 = (t24 * 1U);
    t26 = (0 + t25);
    t9 = (t10 + t26);
    t29 = ((IEEE_P_2592010699) + 4024);
    t31 = (t30 + 0U);
    t32 = (t31 + 0U);
    *((int *)t32) = 9;
    t32 = (t31 + 4U);
    *((int *)t32) = 1;
    t32 = (t31 + 8U);
    *((int *)t32) = -1;
    t33 = (1 - 9);
    t34 = (t33 * -1);
    t34 = (t34 + 1);
    t32 = (t31 + 12U);
    *((unsigned int *)t32) = t34;
    t27 = xsi_base_array_concat(t27, t28, t29, (char)99, t23, (char)97, t9, t30, (char)101);
    t34 = (1U + 9U);
    t35 = (10U != t34);
    if (t35 == 1)
        goto LAB10;

LAB11:    t32 = (t0 + 2912);
    t36 = (t32 + 56U);
    t37 = *((char **)t36);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    memcpy(t39, t27, 10U);
    xsi_driver_first_trans_fast_port(t32);
    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)2);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_size_not_matching(10U, t34, 0);
    goto LAB11;

}


extern void work_a_2704071536_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2704071536_3212880686_p_0};
	xsi_register_didat("work_a_2704071536_3212880686", "isim/test_isim_beh.exe.sim/work/a_2704071536_3212880686.didat");
	xsi_register_executes(pe);
}

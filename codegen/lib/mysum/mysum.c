/*
 * File: mysum.c
 *
 * MATLAB Coder version            : 5.0
 * C/C++ source code generated on  : 31-Oct-2020 18:03:41
 */

/* Include Files */
#include "mysum.h"

/* Function Definitions */

/*
 * Arguments    : const short x[10]
 * Return Type  : short
 */
short mysum(const short x[10])
{
  short y;
  int n;
  int i;
  int b_x;
  y = 0;
  for (n = 0; n < 10; n++) {
    i = y << 2;
    if ((i & 262144) != 0) {
      i |= -262144;
    } else {
      i &= 262143;
    }

    if ((x[n] & 262144) != 0) {
      b_x = x[n] | -262144;
    } else {
      b_x = x[n] & 262143;
    }

    i += b_x;
    if ((i & 262144) != 0) {
      i |= -262144;
    } else {
      i &= 262143;
    }

    i = (i + 2) >> 2;
    if (i > 32767) {
      i = 32767;
    } else {
      if (i < -32768) {
        i = -32768;
      }
    }

    y = (short)i;
  }

  return y;
}

/*
 * File trailer for mysum.c
 *
 * [EOF]
 */

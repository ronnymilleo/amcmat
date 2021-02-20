/*
 * File: _coder_mysum_api.h
 *
 * MATLAB Coder version            : 5.0
 * C/C++ source code generated on  : 31-Oct-2020 18:03:41
 */

#ifndef _CODER_MYSUM_API_H
#define _CODER_MYSUM_API_H

/* Include Files */
#include <stddef.h>
#include <stdlib.h>
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern int16_T mysum(int16_T x[10]);
extern void mysum_api(const mxArray * const prhs[2], int32_T nlhs, const mxArray
                      *plhs[1]);
extern void mysum_atexit(void);
extern void mysum_initialize(void);
extern void mysum_terminate(void);
extern void mysum_xil_shutdown(void);
extern void mysum_xil_terminate(void);

#endif

/*
 * File trailer for _coder_mysum_api.h
 *
 * [EOF]
 */

/*
 * File: main.c
 *
 * MATLAB Coder version            : 5.0
 * C/C++ source code generated on  : 31-Oct-2020 18:03:41
 */

/*************************************************************************/
/* This automatically generated example C main file shows how to call    */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/

/* Include Files */
#include "main.h"
#include "mysum.h"
#include "mysum_terminate.h"

/* Function Declarations */
static void argInit_10x1_sfix16_En15(short result[10]);
static short argInit_sfix16_En15(void);
static void main_mysum(void);

/* Function Definitions */

/*
 * Arguments    : short result[10]
 * Return Type  : void
 */
static void argInit_10x1_sfix16_En15(short result[10])
{
  int idx0;

  /* Loop over the array to initialize each element. */
  for (idx0 = 0; idx0 < 10; idx0++) {
    /* Set the value of the array element.
       Change this value to the value that the application requires. */
    result[idx0] = argInit_sfix16_En15();
  }
}

/*
 * Arguments    : void
 * Return Type  : short
 */
static short argInit_sfix16_En15(void)
{
  return 0;
}

/*
 * Arguments    : void
 * Return Type  : void
 */
static void main_mysum(void)
{
  short iv[10];
  short y;

  /* Initialize function 'mysum' input arguments. */
  /* Initialize function input argument 'x'. */
  /* Initialize function input argument 'T'. */
  /* Call the entry-point 'mysum'. */
  argInit_10x1_sfix16_En15(iv);
  y = mysum(iv);
}

/*
 * Arguments    : int argc
 *                const char * const argv[]
 * Return Type  : int
 */
int main(int argc, const char * const argv[])
{
  (void)argc;
  (void)argv;

  /* The initialize function is being called automatically from your entry-point function. So, a call to initialize is not included here. */
  /* Invoke the entry-point functions.
     You can call entry-point functions multiple times. */
  main_mysum();

  /* Terminate the application.
     You do not need to do this more than one time. */
  mysum_terminate();
  return 0;
}

/*
 * File trailer for main.c
 *
 * [EOF]
 */

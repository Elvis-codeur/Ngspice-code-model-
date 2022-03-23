/*.......1.........2.........3.........4.........5.........6.........7.........8
================================================================================

FILE convolve/cfunc.mod

Public Domain


AUTHORS                      

    21 march 2022 AGBALENYO K. B. Elvis

SUMMARY

    This file contains the model-specific routines used to
    functionally describe the convolve_1d code model.


INTERFACES       

    FILE                 ROUTINE CALLED     

    CMutil.c             void cm_smooth_corner(); 

    CM.c                 void *cm_analog_alloc()
                         void *cm_analog_get_ptr()


REFERENCED FILES

    Inputs from and outputs to ARGS structure.
                     

NON-STANDARD FEATURES

    NONE

===============================================================================*/

/*=== INCLUDE FILES ====================*/

#include "convolution.h";
                                      

/*=== CONSTANTS ========================*/




/*=== MACROS ===========================*/



  
/*=== LOCAL VARIABLES & TYPEDEFS =======*/                         


    
           
/*=== FUNCTION PROTOTYPE DEFINITIONS ===*/




                   
/*==============================================================================

FUNCTION void convolve_1d()

AUTHORS                      

    20 Mar 1991     AGBALENYO Komi  Bathélémy Elvis


SUMMARY

    This function implements the convolve_1d code model.

INTERFACES       

    FILE                 ROUTINE CALLED     

    N/A                  N/A


RETURNED VALUE
    
    Returns inputs and outputs via ARGS structure.

GLOBAL VARIABLES
    
    NONE

NON-STANDARD FEATURES

    NONE

==============================================================================*/

/*=== el_cm_mult ROUTINE ===*/
                                                   


void convolve_1d(ARGS) 

{
    int i;     /* generic loop counter index */
	int size;  /* number of input ports */
    int kernel_size; /* the size of the kernel */ 



    size = PORT_SIZE(in);               /* Note that port size */
    kernel_size = PORT_SIZE(kernel);

    /* Allowing memory to do the convolution */
    double *convolve_data = malloc(sizeof(double)*kernel_size);

    int x ;

    /* Allowing memory to do have the previous data */
    for(x = 0; x < kernel_size; x++)
    {
        cm_analog_alloc(TRUE,sizeof(double));
    }

    /* Allowing memory to do have the previous data */
    for(x = 0; x < kernel_size; x++)
    {
        convolve_data[i] = t2 = (double *) cm_analog_get_ptr(1,x);
    }

    if(ANALYSIS != MIF_AC) {                /* DC & Transient */         

        OUTPUT(out) = convolve(convolve_data,&kernel,kernel_size);
    }
}

PROGRAM program_name
  !   Purpose:
  !
  !       Author: Robert Caddy
  !       Originally Written:
  !       Project:

  ! Import Modules
  !USE module_name, ONLY: procedure_name, data_type, etc
  IMPLICIT NONE !requires that I declare all variables

  !   Parameter Decrations
  INTEGER, PARAMETER        :: dbl       = SELECTED_REAL_KIND(p = 15) ! kind number of a double precision floating point number
  INTEGER, PARAMETER        :: dblint    = SELECTED_INT_KIND(18)      ! kind number of a double precision floating interger number
  REAL, PARAMETER           :: g         = 9.81                       ! acceleration due to gravity (m/s/s)
  REAL(kind=dbl), PARAMETER :: pi        = 3.1415926535897932         ! pi
  REAL(kind=dbl), PARAMETER :: deg_2_rad = pi/180_dbl                 ! Degree to radian conversion facter. Used like rad = deg*deg_2_rad

  !   Variable Declarations
  INTEGER :: start_time   ! execution start time
  INTEGER :: end_time     ! execution end time
  INTEGER :: i,j,k        ! loop indices
  ! ===== END OF DECLARTION SECTION ===========================================

  !   start timer
  CALL SYSTEM_CLOCK(start_time)






  !   Finish up.
  CALL SYSTEM_CLOCK(end_time)
  ! print execution time to terminal
  end_time = end_time - start_time
  WRITE (*,999) end_time/1.E3, end_time/6.E4, end_time/3.6E6
  999 FORMAT (/,'Program complete. Time to execute ', F7.3, 's or ', F7.3, 'min or ', F7.3, 'hrs')
END PROGRAM program_name

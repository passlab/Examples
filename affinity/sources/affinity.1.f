! @@name:	affinity.1
! @@type:	F-fixed
! @@compilable:	yes
! @@linkable:	no
! @@expect:	success
! @@version:	omp_4.0
      PROGRAM EXAMPLE
!$OMP PARALLEL PROC_BIND(SPREAD) NUM_THREADS(4)
      CALL WORK()
!$OMP END PARALLEL
      END PROGRAM EXAMPLE

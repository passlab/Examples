! @@name:	atomic_restrict.2
! @@type:	F-fixed
! @@compilable:	maybe
! @@linkable:	no
! @@expect:	failure
! @@version:	omp_3.1
      SUBROUTINE SUB()
        COMMON /BLK/ R
        REAL R

!$OMP   ATOMIC UPDATE
          R = R + 1.0
      END SUBROUTINE SUB

      SUBROUTINE ATOMIC_WRONG2()
        COMMON /BLK/ I
        INTEGER I

!$OMP   PARALLEL

!$OMP     ATOMIC UPDATE
            I = I + 1
          CALL SUB()
!$OMP   END PARALLEL
      END SUBROUTINE ATOMIC_WRONG2

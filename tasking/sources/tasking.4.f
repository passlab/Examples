! @@name:	tasking.4
! @@type:	F-fixed
! @@compilable:	yes
! @@linkable:	no
! @@expect:	success
! @@version:	omp_3.0
      RECURSIVE INTEGER FUNCTION fib(n) RESULT(res)
      INTEGER n, i, j
      IF ( n .LT. 2) THEN
        res = n
      ELSE
!$OMP TASK SHARED(i)
        i = fib( n-1 )
!$OMP END TASK
!$OMP TASK SHARED(j)
        j = fib( n-2 )
!$OMP END TASK
!$OMP TASKWAIT
        res = i+j
      END IF
      END FUNCTION

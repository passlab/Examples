! @@name:	standalone.2
! @@type:	F-free
! @@compilable:	yes
! @@linkable:	no
! @@expect:	success
! @@version:     omp_3.1
SUBROUTINE STANDALONE_OK()
  INTEGER  A
  A = 1
  IF (A .NE. 0) THEN
    !$OMP FLUSH(A)
  ENDIF
  IF (A .NE. 0) THEN
    !$OMP BARRIER
  ENDIF
  IF (A .NE. 0) THEN
    !$OMP TASKWAIT
  ENDIF
  IF (A .NE. 0) THEN
    !$OMP TASKYIELD
  ENDIF
  GOTO 100
  100 CONTINUE
  !$OMP FLUSH(A)
  GOTO 200
  200 CONTINUE
  !$OMP BARRIER
  GOTO 300
  300 CONTINUE
  !$OMP TASKWAIT
  GOTO 400
  400 CONTINUE
  !$OMP TASKYIELD
END SUBROUTINE

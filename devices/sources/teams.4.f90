! @@name:	teams.4
! @@type:	F-free
! @@compilable:	yes
! @@linkable:	no
! @@expect:	success
! @@version:	omp_4.0
module arrays
integer,parameter :: N=1024*1024
real :: B(N), C(N)
end module
function dotprod() result(sum)
use arrays
   real    :: sum
   integer :: i
   sum = 0.0e0
   !$omp target map(to: B, C) map(tofrom: sum)
   !$omp teams num_teams(8) thread_limit(16) reduction(+:sum)
   !$omp distribute parallel do reduction(+:sum) &
   !$omp&  dist_schedule(static, 1024) schedule(static, 64)
      do i = 1,N
         sum = sum + B(i) * C(i)
      end do
   !$omp end teams
   !$omp end target
end function

! Note:  The variable sum is now mapped with tofrom, for correct 
! execution with 4.5 (and pre-4.5) compliant compilers. See Devices Intro.

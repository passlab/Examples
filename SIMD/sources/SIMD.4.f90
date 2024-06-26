! @@name:	SIMD.4
! @@type:	F-free
! @@compilable:	yes
! @@linkable:	no
! @@expect:	success
! @@version:	omp_4.0
subroutine work( b, n, m )
   implicit none
   real       :: b(n)
   integer    :: i,n,m

   !$omp simd safelen(16)
   do i = m+1, n
      b(i) = b(i-m) - 1.0
   end do
end subroutine work

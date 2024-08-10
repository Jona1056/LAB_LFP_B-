PROGRAM leerestudiantes
character(len=200):: filename
character(len=250) :: Nombre
character(len=250) :: Codigo
integer :: ios

filename = 'estudiantes.txt'

open(unit=10, file=filename, iostat=ios, status='old', action='read')
if ( ios /= 0 ) then
print*, 'Error abriendo el archivo'
stop 
end if
print*, 'no hay error'
print*, 'CONTENIDO DEL ARCHIVO :'

do 
print *, 'Nombre:'
read(10,'(A)', iostat=ios ) Nombre
if ( ios /= 0 ) exit
print*, trim(Nombre)
   print*, ", Codigo : "
read(10,'(A)', iostat=ios ) Codigo
if ( ios /= 0 ) exit
print*, trim(Codigo)
end do

close(10)
print*, 'fin de lectura'

END PROGRAM leerestudiantes
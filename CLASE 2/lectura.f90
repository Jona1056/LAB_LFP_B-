program lectura_simple
    IMPLICIT NONE

    !declaracion variables
    character(len=100) :: filename
    character(len=256) :: line 
    integer :: ios

    filename = 'prueba.txt'

    open(unit=10, file=filename, status='old', action='read', iostat=ios)
    if (ios /= 0) then
        print*, 'Error en el archivo, no se encontro'
        stop 
    end if

    print *, 'Contenido del archivo'

    do  
        read(10, '(A)', iostat=ios) line
        if (ios /= 0 ) exit
        print *, trim(line)

    end do 
     

    close(10)
 
    print *, 'Lectura del archivo completada'

end program lectura_simple
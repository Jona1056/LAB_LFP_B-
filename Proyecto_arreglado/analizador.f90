program procesar_datos
    implicit none
    character(len=100) :: entrada
    read(*, '(A)') entrada
    entrada = trim(entrada) //  char(10) // " valor desde fortran"

    print *, "Resultado:", entrada
end program procesar_datos

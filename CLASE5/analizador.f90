program Analizador 

    implicit none
    character(len=10000) :: entrada ! variable para guardar la entrada
    read(*, '(A)') entrada ! leemos dato que viene de python
    entrada = trim(entrada) // char(10) // "Valor que viene desde Fortran"
    print *, "Resultado de la conexion: ", trim(entrada)

end program Analizador
program generate_graphviz
    implicit none
    integer :: ios
    character(len=250) :: comando 

    open(unit=10, file="graph.dot", status="replace", iostat=ios)
    if (ios /= 0) then
        print*, "Error abrierto el archivo: "
    end if

    write(10, *) "digraph G {"
    write(10, *) "    Suma1 [label=""Suma""];"
    write(10, *) "    Suma1_Num1 [label=""4.5""];"
    write(10, *) "    Suma1_Num2 [label=""5.32""];"
    write(10, *) "    Suma1 -> Suma1_Num1;"
    write(10, *) "    Suma1 -> Suma1_Num2;"
    WRITE(10, *) " }"
    close(10)

    comando = "dot -Tpng graph.dot -o graph.png"
    call system(comando)

    print * ,"Grafico Generado correctamente"



end program generate_graphviz
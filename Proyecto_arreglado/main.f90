program analizador_lexico
    implicit none
    integer :: i, len, linea, columna, estado, puntero, numErrores, file_unit, ios
    integer :: espacio_texto
     ! Definición de un tipo que almacena la información del error
    type :: ErrorInfo
        character(len=10) :: caracter  ! caracter
        character(len=100) :: descripcion  ! Descripción del error
        integer :: columna      ! Columna donde ocurrió el error
        integer :: linea        ! Línea donde ocurrió el error
    end type ErrorInfo

    ! Declaración de un arreglo de errores de tipo ErrorInfo
    type(ErrorInfo), dimension(100) :: errores
    character(len=1) :: char 
    character(len=100) :: tkn
    character(len=1), dimension(26) :: A 
    character(len=1), dimension(26) :: M
    character(len=1), dimension(3) :: S 
    character(len=1) :: char_error

    character(len=10000) :: buffer, contenido
    character(len=10) :: str_codigo_ascii, str_columna, str_linea
    ! Variables para el archivo HTML


    contenido = ''  ! Inicializa contenido vacío

    ! Lee el contenido desde la entrada estándar
    do
        read(*, '(A)', IOSTAT=ios) buffer
        if (ios /= 0) exit 
        contenido = trim(contenido) // trim(buffer) // new_line('a') ! concatenamos el 
        !contenido mas lo que viene en el buffer y como leemos por el salto de linea al final
    end do

    A = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    M = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    S = [':','{','}']
    ! T = ['grafica','nombre'
    ! tokens definidos 

    estado = 0
    puntero = 1
    columna = 1
    linea = 1
    numErrores = 0
    tkn = ''

    len = len_trim(contenido) 

    do while (puntero <= len)
        char = contenido(puntero:puntero)

        if (ichar(char) == 10) then
            ! salto de linea
            columna = 1
            linea = linea + 1
            puntero = puntero + 1
        elseif (ichar(char) == 9) then
            ! tabulacion
            columna = columna + 4
            puntero = puntero + 1
        elseif (ichar(char) == 32) then
            ! espacio en blanco
            columna = columna + 1
            puntero = puntero + 1
        else
            select case (estado)
                case (0)
                    if (any(char == M)) then
                        estado = 1
                        columna = columna + 1
                        tkn = trim(tkn) // char
                
                    else
                        numErrores = numErrores + 1
                      
                        columna = columna + 1
                        estado = 1
                        errores(numErrores) = ErrorInfo(char, "Error no pertenece al lenguaje M", columna, linea)

                    end if
                    puntero = puntero + 1
                case (1)
                    
                    if (any(char == M)) then
                      
                        estado = 1
                        columna = columna + 1
                        tkn = trim(tkn) // char
                      
                    else if (any(char == S)) then
                        ! numErrores = numErrores + 1
                        ! errores(numErrores) = ErrorInfo(tkn, "tkn", columna, linea)
                        ! if (tkn == "grafica")then
                        !      print *, "si es igual"
                        ! end if
                        !! LA PARTE DE ARRIBA ES PARA VALIDAR EL TOKEN 
                        columna = columna + 1
                        estado = 2
                        ! agregar a tabla de tokens el tkn y el char
                        tkn = ""
                    else
                        numErrores = numErrores + 1
                        errores(numErrores) = ErrorInfo(char, "caracter no pertecene", columna, linea)
                        columna = columna + 1
                        estado = 1
                    end if
                    puntero = puntero + 1
                case (2)
                    if (any(char == S)) then
                        columna = columna + 1
                        estado = 3
                        ! agregar el char
                    else
                        numErrores = numErrores + 1
                        errores(numErrores) = ErrorInfo(char, "caracter no pertecene", columna, linea)
                        columna = columna + 1
                        estado = 2
                    end if
                    puntero = puntero + 1
                case (3)
                    puntero = puntero + 1
                    if (any(char == M)) then
                        estado = 3
                        columna = columna + 1
                        tkn = tkn // char
                    else if (any(char == S)) then
                        columna = columna + 1
                        estado = 4
                        ! agregar a tabla de tokens el tkn y el char
                        tkn = ""
                    else
                        numErrores = numErrores + 1
                         errores(numErrores) = ErrorInfo(char, "caracter no pertecene", columna, linea)
                        columna = columna + 1
                        estado = 3
                    end if
                case (4)
                    puntero = puntero + 1
            end select
        end if
    end do

    ! Si hay errores, se crea el archivo HTML
    if (numErrores > 0) then
      call generar_html_errores(numErrores, errores)
    else
        print *, "No hay errores en el código."
end if

contains

   subroutine generar_html_errores(numErrores, errores)
        implicit none
        integer, intent(in) :: numErrores
        type(ErrorInfo), intent(in) :: errores(numErrores)
        character(len=100000) :: html_content
        character(len=100) :: str_descripcion, str_columna, str_linea,char_error

        integer :: file_unit, ios, i

        ! Si hay errores, se crea el archivo HTML
       if (numErrores > 0) then
    ! Abrir el archivo para escribir
            open(unit=file_unit, file="errores.html", status="replace", action="write", iostat=ios)
            if (ios /= 0) then
                print *, "Error al crear el archivo HTML."
            else
                ! Escribir la cabecera del HTML directamente al archivo
                write(file_unit, '(A)') '<!DOCTYPE html>' // new_line('a')
                write(file_unit, '(A)') '<html><head><style>' // new_line('a')
                write(file_unit, '(A)') 'table { font-family: Arial, sans-serif;'
                write(file_unit, '(A)') 'border-collapse: collapse; width: 100%; }' // new_line('a')
                write(file_unit, '(A)') 'td, th { border: 1px solid #dddddd; text-align: left; padding: 8px; }' // new_line('a')
                write(file_unit, '(A)') 'tr:nth-child(even) { background-color: #f2f2f2; }' // new_line('a')
                write(file_unit, '(A)') '</style></head><body><h2>Tabla de Errores</h2>' // new_line('a')
                write(file_unit, '(A)') '<table><tr><th>Carácter</th><th>Descripcion' 
                write(file_unit, '(A)') '</th><th>Columna</th><th>Línea</th></tr>' // new_line('a')

                ! Bucle para formatear cada código ASCII y cada columna

                ! Bucle para agregar filas a la tabla
                do i = 1, numErrores
                    write(str_descripcion, '(A)') trim(errores(i)%descripcion)
                    write(str_columna, '(I0)') errores(i)%columna
                    write(str_linea, '(I0)')  errores(i)%linea
                    write(char_error, '(A)') trim(errores(i)%caracter)
         
                    ! Escribir cada fila directamente al archivo

                    write(file_unit, '(A)') '<tr><td>' // char_error // '</td><td>' // trim(str_descripcion) // & 
                    '</td><td>' // trim(str_columna) // '</td><td>'&
                     // trim(str_linea) // '</td></tr>' // new_line('a')
                end do

                ! Cerrar la tabla y el HTML
                write(file_unit, '(A)') '</table></body></html>'
                close(file_unit)
            end if
        else
            print *, "No hay errores en el código."
        end if
    end subroutine generar_html_errores

    function itoa(num) result(str)
        implicit none
        integer, intent(in) :: num
        character(len=20) :: str

        write(str, '(I0)') num  ! Convierte el entero 'num' a cadena
    end function itoa

end program analizador_lexico
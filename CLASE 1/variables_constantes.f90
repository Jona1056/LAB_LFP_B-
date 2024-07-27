PROGRAM variablesconstantes
    IMPLICIT NONE
    ! Declaracion De Constantes
    ! TIPO , PARAMETER :: NOMBRE_VARIABLE = VALOR
    INTEGER, PARAMETER :: MAX_ITER = 10
    REAL, PARAMETER :: PI = 3.14159265358

    ! Declaracion de Variables
    !FLOAT DOUBLE
    double precision :: area
    character(len=20) :: nombre
    logical :: es_true = .TRUE.
    logical :: es_false = .FALSE.
    REAL :: radio
    INTEGER :: i

    area = PI * radio**2 ! A = PI * R^2




    DO i = 1, MAX_ITER 
        PRINT *, 'Iteracion ', i
    END DO


END PROGRAM variablesconstantes
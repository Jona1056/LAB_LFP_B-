PROGRAM variablesConstantes
  IMPLICIT NONE

  ! Declaración de constantes
  INTEGER, PARAMETER :: MAX_ITER = 10
  REAL, PARAMETER :: PI = 3.14159265358979

   
   
    double precision :: area
    character(len=20) :: nombre
    logical :: es_true = .TRUE.
    logical :: es_false = .FALSE.
  ! Declaración de variables
    INTEGER :: i
    REAL :: radius

  ! Inicialización de variables
    radius = 5.0

  ! Cálculo del área del círculo usando la constante PI
    area = PI * radius**2  ! A = PI * r^2 potencia

  ! Mostrar resultados
    PRINT *, 'El valor de PI es: ', PI
    PRINT *, 'El radio del círculo es: ', radius
    PRINT *, 'El área del círculo es: ', area

  ! Ejemplo de ciclo usando la constante MAX_ITER
    DO i = 1, MAX_ITER
        PRINT *, 'Iteracion: ', i
    END DO

  !ERROR DE ASIGNACION A MAX_ITER
!   MAX_ITER = 20

END PROGRAM variablesConstantes
PROGRAM ejemplofunciones
    IMPLICIT NONE

    REAL :: numero, resultado
    REAL :: numero1, numero2
    REAL :: nota_calificacion

    PRINT *, 'Ingrese un numero:'
    READ *, numero
    resultado = Cuadrado(numero)
    print *, 'El cuadrado de ', numero, ' es ', resultado


    print *, 'INTRODUCE LA NOTA DE LA CALIFICACION: '
    READ *, nota_calificacion
    IF (esAprobado(nota_calificacion)) THEN
     print *, 'Esta aprobado!'
    ELSE
     print *, 'Esta reprobado!'
    END IF

 CONTAINS

 LOGICAL FUNCTION esAprobado(calificacion)

 REAL, INTENT(IN) :: calificacion
 If (calificacion < 61) THEN
    esAprobado = .FALSE.
    ELSE
    esAprobado =.TRUE.
    END IF

 END FUNCTION esAprobado


 Integer FUNCTION Cuadrado(x) 

    REAL, INTENT(IN) :: x
    ! TIPO IGUAL AL QUE VIENE, 
    !INTENT(IN)
    !INTENT(OUT)
    !INTENT(INOUT)

    Cuadrado = x**2
  END FUNCTION Cuadrado
  
END PROGRAM ejemplofunciones
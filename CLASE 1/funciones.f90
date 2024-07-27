PROGRAM EjemploFunciones
  IMPLICIT NONE

  REAL :: numero, resultado
  REAL :: numero1, numero2  
  REAL :: nota_calificacion

  ! Leer un número del usuario
  PRINT *, 'Introduce un número:'
  READ *, numero

  ! Llamar a la función Cuadrado
  resultado = Cuadrado(numero)

  ! Mostrar el resultado
  PRINT *, 'El cuadrado de ', numero, ' es ', resultado
  
  PRINT *, 'Introduce dos números:'
  PRINT *, 'Número 1:'
  READ *, numero1
  PRINT *, 'Número 2:'
  READ *, numero2
    ! Llamar a la función SumaCuadrados
  resultado = SumaCuadrados(numero1, numero2)
  PRINT *, 'La suma de los cuadrados de ', numero1, ' y ', numero2, ' es ', resultado

  print *, 'Introduce la nota de la calificación:'
    read *, nota_calificacion
    if (esAprobado(nota_calificacion)) then
        print *, 'El estudiante ha aprobado'
    else
        print *, 'El estudiante ha reprobado'
    end if
    CONTAINS

  ! Definición de la función Cuadrado
 Integer FUNCTION Cuadrado(x) 
    REAL, INTENT(IN) :: x
  
    Cuadrado = x**2
  END FUNCTION Cuadrado

  Integer FUNCTION SumaCuadrados(x, y)
    REAL, INTENT(IN) :: x, y
    REAL :: suma, numero1, numero2
    
    numero1 = Cuadrado(x)
    numero2 = Cuadrado(y)
    SumaCuadrados = numero1 + numero2
  END FUNCTION SumaCuadrados

  Logical FUNCTION esAprobado ( calificacion )
    implicit none
    ! Argumentos
    Real calificacion
    INTENT (IN) calificacion
    ! Cuerpo de la función
    If (calificacion <5) Then
    esAprobado = .False.
    Else
    esAprobado = .True.
    End if
    END FUNCTION esAprobado

END PROGRAM EjemploFunciones

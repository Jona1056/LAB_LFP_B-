program principal
  implicit none

  real :: radio, area_base, altura, volumen

  ! Definir valores iniciales
  radio = 10
  area_base = 3.1416 * radio**2

  ! Llamada a la subrutina
  print *, area_base
  call cilindro(radio, area_base, altura, volumen)

  ! Imprimir los resultados
  print*, 'Altura:', altura
  print*, 'Volumen:', volumen
  print*, 'Área Superficial:', area_base
end program principal

subroutine asteriscos(n)
  implicit none !Esta declaración indica que todas las variables deben ser explícitamente declaradas. Esto ayuda a evitar errores por el uso de variables no declaradas.
  ! Argumentos
  integer, intent(in) :: n
  ! Variables
  integer :: i
  ! Cuerpo de la subrutina
  do i = 1, n
    print*, "*"
  end do
end subroutine asteriscos


SUBROUTINE cilindro ( radio, area, altura, volumen )
  implicit none
  ! Constantes
  real, parameter :: Pi = 3.1416
  ! Argumentos
  real :: radio, area, altura, volumen
  INTENT (IN) :: radio
  INTENT (OUT) :: altura, volumen
  INTENT (INOUT) :: area ! Contiene el área de la base y devuelve el área del cilindro
  ! Cuerpo de la subrutina
  print*, "Dame la altura del cilindro"
  read*, altura
  volumen = area * altura
  area = 2 * Pi * radio * altura + 2 * area
END SUBROUTINE cilindro
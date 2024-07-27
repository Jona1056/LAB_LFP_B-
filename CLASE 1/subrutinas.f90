PROGRAM PRINCIPAL
IMPLICIT NONE
 real :: radio, area_base, altura, volumen
 radio = 10
 area_base = 3.1416 * radio**2

 call cilindro(radio,area_base, altura, volumen)
 print*, 'Altura: ', altura
 print*, 'Volumen: ', volumen
 print*, 'Area base: ', area_base

END PROGRAM PRINCIPAL

subroutine cilindro(radio, area_base, altura, volumen)
 implicit none
 real, PARAMETER :: PI = 3.1416
 real :: radio,area_base,altura,volumen
 INTENT(IN) :: radio !entrada
 INTENT(OUT) :: altura, volumen
 INTENT(INOUT) :: area_base

 print*, 'Dame la altura del cilindro'
 read*, altura
 volumen = area_base * altura
 print*, 'area base dentro de la subrutina', area_base
 area_base = 2 * PI * radio * altura + 2 * area_base

 END subroutine CILINDRO
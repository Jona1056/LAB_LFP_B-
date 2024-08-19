
MODULE StudentModule
  IMPLICIT NONE


  TYPE :: Student
    CHARACTER(LEN=100) :: name
    INTEGER :: age
    CHARACTER(LEN=20) :: carnet
  END TYPE Student

CONTAINS


  SUBROUTINE initStudent(st, name, age, carnet)
    TYPE(Student), INTENT(OUT) :: st
    CHARACTER(LEN=*), INTENT(IN) :: name
    INTEGER, INTENT(IN) :: age
    CHARACTER(LEN=*), INTENT(IN) :: carnet

    st%name = name
    st%age = age
    st%carnet = carnet
  END SUBROUTINE initStudent


  SUBROUTINE displayStudent(st)
    TYPE(Student), INTENT(IN) :: st

    PRINT *, 'Name: ', TRIM(st%name)
    PRINT *, 'Age: ', st%age
    PRINT *, 'Carnet: ', TRIM(st%carnet)
  END SUBROUTINE displayStudent


  SUBROUTINE reportStudent(st, filename)
    TYPE(Student), INTENT(IN) :: st
    CHARACTER(LEN=*), INTENT(IN) :: filename
    INTEGER :: unit_num


    open(newunit=unit_num, file=filename, status='unknown')


    write(unit_num, '(A)') '**************************************'
    write(unit_num, '(A)') '*           Reporte Estudiantes           *'
    write(unit_num, '(A)') '**************************************'
    write(unit_num, '(A)') ''
    write(unit_num, '(A)') '-------------------------------------------------'
    write(unit_num, '(A20, A10, A20)') 'Nombre', 'Edad', 'Carnet'
    write(unit_num, '(A)') '-------------------------------------------------'

   
    write(unit_num, '(A20, I10, A20)') TRIM(st%name), st%age, TRIM(st%carnet)

    write(unit_num, '(A)') '-------------------------------------------------'


    close(unit_num)
  END SUBROUTINE reportStudent

END MODULE StudentModule


PROGRAM TestStudent
  USE StudentModule
  IMPLICIT NONE

  TYPE(Student) :: student1


  CALL initStudent(student1, 'John Doe', 20, '20240001')


  CALL displayStudent(student1)

  CALL reportStudent(student1, 'student_report.txt')

END PROGRAM TestStudent

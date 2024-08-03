MODULE StudentModule

    Type :: Student
        CHARACTER(LEN=100) :: name
        INTEGER :: age
        CHARACTER(LEN=20) :: carnet
    END TYPE Student

CONTAINS

    SUBROUTINE initStudent(st,name,age,carnet)
        TYPE(Student), INTENT(OUT) :: st
        CHARACTER(LEN=*) :: name
        INTEGER :: age
        CHARACTER(LEN=*) :: carnet

        st%name = name 
        st%age = age
        st%carnet = carnet
    END SUBROUTINE initStudent

    SUBROUTINE printStudent(st)
        TYPE(Student), INTENT(IN) :: st
        print *, 'Nombre: ' , TRIM(st%name)
        print *, 'Edad: ' , st%age
        print *, 'Carnet: ' , TRIM(st%carnet)
    END SUBROUTINE printStudent

END MODULE StudentModule

PROGRAM TestStudent
    USE StudentModule
    IMPLICIT NONE

    TYPE(Student) :: estudiante1
    ! inicializar estructura para estudiante
    CALL initStudent(estudiante1,'Jonatan',22, '202000424')

    CALL printStudent(estudiante1)

END PROGRAM TestStudent
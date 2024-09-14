import tkinter as tk
from tkinter import filedialog, Menu
import subprocess

def enviar_datos():
    # Limpiar el área de texto derecha antes de analizar
    right_text_area.delete("1.0", tk.END)
    
    # Obtener el contenido del área de texto izquierda
    data = left_text_area.get("1.0", tk.END)
    
    # Compilar y ejecutar el código Fortran
    comando = subprocess.run(
        ["gfortran", "-o", "main.exe", "main.f90"],  # compilación de Fortran
        check=True  # detener si hay un error en la compilación
    )
    resultado = subprocess.run(
        ["./main.exe"],  # Ejecutable de Fortran
        input=data,  # la data que se manda a Fortran
        stdout=subprocess.PIPE,  # la data que viene de Fortran   
        text=True  # la salida se maneja como texto
    )
    
    # Insertar la nueva salida en el área de texto derecha
    right_text_area.insert(tk.END, resultado.stdout)

def abrir_archivo():
    # Abrir un cuadro de diálogo para seleccionar un archivo
    archivo = filedialog.askopenfilename(
        title="Abrir archivo",
        filetypes=[("Archivos de texto", "*.org"), ("Todos los archivos", "*.*")]
    )
    
    if archivo:
        with open(archivo, "r") as file:
            contenido = file.read()
            # Borrar el contenido anterior y cargar el archivo en el área de texto izquierda
            left_text_area.delete("1.0", tk.END)
            left_text_area.insert(tk.END, contenido)

# Crear la ventana principal
ventana = tk.Tk()
ventana.title("Interfaz Tkinter con Fortran")

# Crear el menú principal
menu_bar = Menu(ventana)
ventana.config(menu=menu_bar)

# Crear el menú de archivo
archivo_menu = Menu(menu_bar, tearoff=0)
menu_bar.add_cascade(label="Archivo", menu=archivo_menu)
archivo_menu.add_command(label="Abrir", command=abrir_archivo)
archivo_menu.add_command(label="Guardar")
archivo_menu.add_command(label="Guardar como...")

# Crear un marco para organizar las áreas de texto
frame = tk.Frame(ventana)
frame.pack(fill=tk.BOTH, expand=True)

# Crear el área de texto izquierda para mostrar el contenido del archivo
left_text_area = tk.Text(frame, height=20, width=50)
left_text_area.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

# Crear el área de texto derecha para mostrar la salida de Fortran
right_text_area = tk.Text(frame, height=20, width=50)
right_text_area.pack(side=tk.RIGHT, fill=tk.BOTH, expand=True)

# Botón para enviar los datos a Fortran
tk.Button(ventana, text="Analizar", command=enviar_datos).pack()

# Iniciar el bucle principal de la interfaz gráfica
ventana.mainloop()

import tkinter as tk
import subprocess

def enviar_datos():
    data = entrada.get()
    comando = subprocess.run(
        ["gfortran", "-o", "main.exe", "main.f90"], # compilacion de fortran
        check=True  # si hay un error en la compilacion, la ejecucion se detiene
    )
    resultado = subprocess.run(
        ["./main.exe"], #RUTA DEL EJECTUBLE DE FORTRAN
        input = data, #la data que se manda a fortran
        stdout = subprocess.PIPE,  # la data que viene de fortran   
        text= True # que la salida se maneje como texto 
    )
  
    output_area.insert(tk.END, resultado.stdout)
    
    
    
    
ventana = tk.Tk()
ventana.title("Interfaz Tkinter Con Fortran")

tk.Label(ventana, text="Ingrese un valor").pack
entrada = tk.Entry(ventana)
entrada.pack()

tk.Button(ventana, text="Enviar Datos a Fortran", command=enviar_datos ).pack()
output_area = tk.Text(ventana,height=10, width=50)
output_area.pack()
    
ventana.mainloop()
import tkinter as tk
import subprocess

# def enviar_datos():
#     # data = entry.get()
    
    
ventana = tk.Tk()
ventana.title("Interfaz Tkinter Con Fortran")

tk.Label(ventana, text="Ingrese un valor").pack
entrada = tk.Entry(ventana)
entrada.pack()

tk.Button(ventana, text="Enviar Datos" ).pack()
output_area = tk.Text(ventana,height=10, width=50)
output_area.pack()
    
ventana.mainloop()
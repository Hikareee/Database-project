
# This file was generated by the Tkinter Designer by Parth Jadhav
# https://github.com/ParthJadhav/Tkinter-Designer

from pathlib import Path
import mysql.connector as mysql
import mariadb
# from tkinter import *
# Explicit imports to satisfy Flake8
from tkinter import Tk, Canvas, Entry, Text, Button, PhotoImage

from tkinter import messagebox as MessageBox
OUTPUT_PATH = Path(__file__).parent
ASSETS_PATH = OUTPUT_PATH / Path(r"G:\Database UI testing\build\assets\frame3")


def relative_to_assets(path: str) -> Path:
    return ASSETS_PATH / Path(path)


window = Tk()

window.geometry("1930x1101")
window.configure(bg = "#FFFFFF")


canvas = Canvas(
    window,
    bg = "#FFFFFF",
    height = 1101,
    width = 1930,
    bd = 0,
    highlightthickness = 0,
    relief = "ridge"
)

canvas.place(x = 0, y = 0)
canvas.create_rectangle(
    0.0,
    0.0,
    1930.0,
    298.0,
    fill="#FCBBBB",
    outline="")

canvas.create_rectangle(
    0.0,
    121.0,
    1930.0,
    1101.0,
    fill="#FDCBCB",
    outline="")

canvas.create_rectangle(
    25.0,
    298.0,
    1912.0,
    1079.0,
    fill="#FFFFFF",
    outline="")

canvas.create_text(
    84.0,
    177.0,
    anchor="nw",
    text="Sponsors ",
    fill="#FFFFFF",
    font=("Inter", 36 * -1)
)

canvas.create_text(
    110.0,
    361.0,
    anchor="nw",
    text="ID",
    fill="#FCBBBB",
    font=("Inter", 36 * -1)
)

entry_image_1 = PhotoImage(
    file=relative_to_assets("entry_1.png"))
entry_bg_1 = canvas.create_image(
    361.5,
    444.5,
    image=entry_image_1
)
entry_1 = Entry(
    bd=0,
    bg="#FDCBCB",
    fg="#000716",
    highlightthickness=0
)
entry_1.place(
    x=114.0,
    y=412.0,
    width=495.0,
    height=63.0
)

canvas.create_text(
    1.0,
    0.0,
    anchor="nw",
    text="Event Management",
    fill="#FFFFFF",
    font=("Inter", 48 * -1)
)

button_image_1 = PhotoImage(
    file=relative_to_assets("button_1.png"))
button_1 = Button(
    image=button_image_1,
    borderwidth=0,
    highlightthickness=0,
    command=lambda: print("button_1 clicked"),
    relief="flat"
)
button_1.place(
    x=1595.0,
    y=177.0,
    width=228.0,
    height=82.0
)


def delete_sponsors():
    id = entry_1.get()

    if (id == ""):
        MessageBox.showinfo("insert Status", "All fields are required")
    else:
        con = mariadb.connect(host="localhost", user="root",
                              password="", database="event_db")
        custor = con.cursor()
        custor.execute("DELETE FROM sponsors WHERE id ="+id)
        custor.execute("commit")
        con.close()

button_image_2 = PhotoImage(
    file=relative_to_assets("button_2.png"))
button_2 = Button(
    image=button_image_2,
    borderwidth=0,
    highlightthickness=0,
    command=delete_sponsors,
    relief="flat"
)
button_2.place(
    x=1583.0,
    y=944.0,
    width=240.0,
    height=82.0
)
window.resizable(False, False)
window.mainloop()

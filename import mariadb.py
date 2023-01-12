import mysql.connector
import mariadb
import tkinter as tk
from tkinter import *
my_w = tk.Tk()
my_w.geometry("400x250")
my_connect = mariadb.connect(
    host="localhost",
    user="root",
    passwd="",
    database="event_db"
)

my_conn = my_connect.cursor()
my_conn.execute("SELECT * FROM events")
e = Label(my_w, width=30, text='id', borderwidth=2,
          relief='ridge', anchor='w' )
e.grid(row=0, column=0)
e = Label(my_w, width=30, text='Type_id', borderwidth=2,
          relief='ridge', anchor='w' )
e.grid(row=0, column=1)
e = Label(my_w, width=30, text='EventName', borderwidth=2,
          relief='ridge', anchor='w' )
e.grid(row=0, column=2)
e = Label(my_w, width=30, text='Ticket price', borderwidth=2,
          relief='ridge', anchor='w' )
e.grid(row=0, column=3)
e = Label(my_w, width=30, text='Description', borderwidth=2,
          relief='ridge', anchor='w' )
e.grid(row=0, column=4)
e = Label(my_w, width=30, text='Date', borderwidth=2,
          relief='ridge', anchor='w' )
e.grid(row=0, column=5)
e = Label(my_w, width=30, text='Status', borderwidth=2,
          relief='ridge', anchor='w' )
e.grid(row=0, column=6)
e = Label(my_w, width=30, text='Address', borderwidth=2,
          relief='ridge', anchor='w' )
e.grid(row=0, column=7)
i = 1
for events in my_conn:
    for j in range(len(events)):
        e = Entry(my_w, width=30, fg='black')
        e.grid(row=i, column=j)
        e.insert(END, str(events[j]))
    i = i+1
my_w.mainloop()

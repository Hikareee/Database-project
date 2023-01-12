import mysql.connector as mysql
import mariadb
from tkinter import *
from tkinter import messagebox as MessageBox
def insert_event():
    type_id = e_type_id.get()
    name = e_name.get()
    price = e_price.get()
    description = e_desc.get()
    date = e_date.get()
    status = e_status.get()
    address = e_address.get()
    
    if ( name =="" or price == ""):
        MessageBox.showinfo("insert Status", "All fields are required");
    else:
        con = mariadb.connect(host = "localhost", user="root", password="", database = "event_db")
        custor = con.cursor()
        custor.execute("insert into events (type_id, name, price, description, date, status, address) values(" + type_id + "," + "'" + name + "'" + "," + price + "," + "\"" + description + "\"" "," + "'" + date + "'" + "," + "\""+status+"\"" + "," + "\""+ address + "\"" +")")
        custor.execute("commit")
        con.close()

def show_event():
    con = mariadb.connect(host="localhost", user="root",password="", database="event_db")
    custor = con.cursor()
    custor.execute("select * from events")
    print(custor.fetchall())

    con.close()
    

root = Tk()
root.geometry("1920x1080")
root.title("Database management system")

id = Label(root, text='Enter ID',font=('bold',10))
id.place(x=20, y=30)

type_id = Label(root, text='Enter Type id',font=('bold',10))
type_id.place(x=20,y=120)

name = Label(root,text='Enter Username', font = ('bold',10))
name.place(x=20,y=60)

price = Label(root,text = 'Enter Price', font=('bold',10))
price.place(x=20,y=150)

description = Label(root,text = 'Enter Description', font=('bold',10))
description.place(x=20,y=180)

date = Label(root, text = 'Enter Date', font=('bold', 10))
date.place(x=20, y=90)

status = Label(root,text = 'Enter Status', font=('bold',10))
status.place(x=20,y=210)

address = Label(root,text = 'Enter address', font=('bold',10))
address.place(x=20,y=240)


e_type_id = Entry()
e_type_id.place(x=150,y=120)

e_name = Entry()
e_name.place(x=150,y=60)

e_desc = Entry()
e_desc.place(x=150,y=90)

e_price = Entry()
e_price.place(x=150,y=150)

e_date = Entry()
e_date.place(x=150,y=180)

e_status = Entry()
e_status.place(x=150,y=210)

e_address = Entry()
e_address.place(x=150,y=240)

insert = Button(root, text="insert", font=("italic",10),bg="white", command = insert_event)
insert.place(x=20,y=260)

list = Listbox(root)
list.place(x=290, y=30)
show_event()


root.mainloop()

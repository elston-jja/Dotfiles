from Tkinter import *


! grid placement

.pack() places widgets in the middle
.place(x='cord',y='cord') places the widget on an x and y cord on your screen
.grid(row=num,column=num) places the widget on  the row and column on your screen
.grid(sticky=N,S,E,W)     places the widget on the directions side


! visual manipulation

obj.configure(fg = 'name of color') foreground color
obj.configure(bg = 'name of color') background color


! Widgets

Label is just text on screen
somevar = Label(window,text='do somthing').grid(row...)

Button is just a little button on screen
somevar = Button(window,text='do something',command = callsomething).grid(row...)

Entry is a little place where the user can type stuff in
variable_name = StringVar() # string var
somevar= Entry(window,textvariable=variable_name).grid(row...)
!! calling an entry
realvar=variable_name.get()

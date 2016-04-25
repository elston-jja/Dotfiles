from Tkinter import *

# create the window
lottery= Tk()

# Inside
lottery.title("Lottery Name Generator")
lottery.geometry("900x900")

app = Frame(lottery)
app.grid()

button = Button(app)
button.configure(text = "Click Here to Begin")
button.grid()


# create the loop
lottery.mainloop()

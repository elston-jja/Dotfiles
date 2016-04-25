from Tkinter import *

class application(Frame):

    def __init__(self, master =  None):
        Frame.__init__(self, master)
        self.grid()
        self.create_widgets()

    def create_widgets(self):
        self.button = Button(self)
        self.button.configure(text = "Print label",command = self.test())
        self.button.grid()

    def test(self):
        self.label = Label(self)
        self.label.configure(text = "hello world")
        self.label.grid()

window = Tk()
window.title("Gui Programming")
window.geometry("300x300")
application(window)
window.mainloop()

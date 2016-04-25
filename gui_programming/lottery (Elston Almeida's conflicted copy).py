from Tkinter import *
from random import randint

class app(Frame):

    '''Initializes the window'''
    def __init__(self,master):
        Frame.__init__(self,master)
        self.grid()
        self.user_name_list = []
        self.intro()
        self.name_input()
        self.done_button()
        
    '''Tells the user how to use the program'''    
    def intro(self):
        self.intro = 'Welcome, please enter contestants and click the done button'
        self.intro_label = Label(self,text = self.intro)
        self.intro_label.grid(row=0,column=0,sticky=E)

    '''Create text box to input names'''
    def name_input(self):
        self.name_inp = StringVar() 
        self.name_entry = Entry(self, textvariable = self.name_inp)
        self.name_entry.grid(row=1,column=0)
        self.name_entry.bind('<Return>', self.check)
        
    '''Makes sure the input is valid'''
    def check(self,event):
        try:
            if self.error_label:
                self.error.destroy()
        except:
            pass
        self.name = self.name_inp.get()
        if self.name == '':
            self.error_label("No input",5,0)
        elif  15 < len(self.name) or len(self.name) < 3:
            self.error_label("Input too short",5,0)
        else:
            self.user_name_list.append(self.name)
            self.name_entry.delete(0,'end')
            #self.printed_list()

    '''Calling the error statemnt'''
    def error_label(self,error,r,c):
        self.error = Label(self, text = error,fg='red')
        self.error.grid(row = r,column = c)
        
    '''Call later for help debugging list'''
    #def printed_list(self):
    #    self.name_list = self.user_name_list
    #    self.name_list_label = Label(self,text = self.name_list)
    #    self.name_list_label.grid(row=4,column=0)

    '''Done button to call eliminations'''
    def done_button(self):
        self.done = Button(self,text = "Done",command = self.elimination_sequence)
        self.done.grid(row=3,column=2)
        
    '''Eliminates names in sequence'''
    def elimination_sequence(self):
        self.intro_label.destroy()
        self.done.destroy()
        self.name_entry.delete(0,'end')
        self.name_entry.destroy()
        while len(self.user_name_list) > 1:
            self.eliminate = randint(0,(len(self.user_name_list)-1))
            eliminate_label = Label(self,text=self.user_name_list[self.eliminate])
            eliminate_label.grid()
            self.user_name_list.pop(self.eliminate)
        self.winner()

    '''Lables the winner'''
    def winner(self):
        self.winner = self.user_name_list[0]
        self.winner_label = Label(self,text =(str(self.winner) +' is the winner'))
        self.winner_label.grid(row=10,column=30)
        
lottery_window = Tk()
lottery_window.title('lottery picker')
#lottery_window.geometry('600x600')


app(lottery_window)
lottery_window.mainloop()
    

import pygame
import string
def mouse_quadrant():
    if event.type == pygame.MOUSEBUTTONUP:
        mouse = pygame.mouse.get_pos()
        allchars = ''.join(chr(i) for i in xrange(256))
        identity = string.maketrans('', '')
        nondigits = allchars.translate(identity, string.digits)
        mouse_x = ((str(mouse)[0:4]).translate(identity, nondigits))
        mouse_y = ((str(mouse)[5:]).translate(identity, nondigits))
        mouse_y = int(mouse_y)
        mouse_x = int(mouse_x)
        print mouse_x,mouse_y
        if (mouse_x < 170) and (mouse_y < 170) :
            print "quad 1"
            return 1
        elif (170 < mouse_x < 340) and (mouse_y < 170 ):
            print "quad 2"
            return 2
        elif (340 < mouse_x) and (mouse_y < 170):
            print "quad 3"
            return 3
        elif (mouse_x < 170) and (170 < mouse_y < 340 ):
            print "quad 4"
            return 4
        elif (170 < mouse_x < 340) and (170 < mouse_y < 340 ):
            print "quad 5"
            return 5
        elif (340 < mouse_x) and (170 < mouse_y < 340 ):
            print "quad 6"
            return 6
        elif (mouse_x < 170) and (340 < mouse_y) :
            print "quad 7"
            return 7
        elif (170 < mouse_x < 340) and (340 < mouse_y):
            print "quad 8"
            return 8
        else:
            print "quad 9"
            return 9
def input_is_valid():
    try:
        piece_validate = raw_input()
        piece_validate = int(piece_validate)
        if not piece_validate:
            print "Please enter a character to get started"
        elif piece_validate > 2 :
            print "Please choose a valid option"
        else:
            return (piece_validate)
    except:
        print "Please choose a valid option"
def intro():
    print "please choose a character\n1.X\n2.O\nUse the values 1 or 2 to choose: ",
    #
def draw_x(mouse):
    if location ==  1:
        screen.blit(x_piece,(65,65))
pygame.init()
pygame.display.set_caption("Tic-Tac-Toe")
screen = pygame.display.set_mode((512,512))
x_piece = pygame.image.load("Images/x.png").convert_alpha()
o_piece = pygame.image.load("Images/o.png").convert_alpha()
background = pygame.image.load("Images/background.jpg").convert()
quad_one = None
running = True
piece = 1
location = None
while running is True:
    # any events that need to be recorded in here
    #piece = input_is_valid()
    #when implementing O later
    if piece == 1:
        piece = x_piece
    elif piece == 2:
        piece = o_piece
    screen.blit(background,(0,0))
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
        mouse = mouse_quadrant()
        if mouse:
            print mouse
    draw_x(mouse)
    #screen.blit(x_piece,(65,65))
    pygame.display.update()

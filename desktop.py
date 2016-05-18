import pygame

#SIMPLE DRAWING

# COLORS

BLACK = (0,0,0)
RED = (255,0,0)
GREEN = (0,255,0)
BLUE = (0,0,255)
WHITE = (255,255,255)

# Windows 004E98
light_blue = (0x00,0x4E,0x98)
# Task bar #DED8D3
task_color = (0xDE,0xD8,0xD3)
# Shadow #404040
shadow = (0x40,0x40,0x40)
# Folder #FFCD7A
folder_color = (0xFF,0xCD,0x7A)

PI = 3.141592653

# Initialize the pygame library
pygame.init()

# Size of game window (WIDTH,HEIGHT)
size = (600,400)
screen = pygame.display.set_mode(size)

# Game window title
pygame.display.set_caption("Desktop.jpg")

# Do not quit loop 
done = False

font = pygame.font.SysFont("monospace",12)

# How fast the screen updates
clock = pygame.time.Clock()

# While done is False
# main()
while not done:

    # Track user events
    for event in pygame.event.get():
        # Checks if user ends the game
        if event.type == pygame.QUIT:
            done = True
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_q:
                done = True

    # Background
    screen.fill(light_blue)
    
    # 1 Draw task bar background
    pygame.draw.rect(screen, task_color, [0,380,600,20])

    # 2 Draw start outline
    pygame.draw.rect(screen, shadow, [2,381,60,17],2)

    # 3 Draw start text # DO windows logo later ???
    start_text = font.render("Start",1,(0,0,0))
    screen.blit(start_text, (14,383))

    # 4 Draw taskbar outline
    pygame.draw.rect(screen, shadow, [500,381,98,17],2)




    
    # FOLDER ICON
    for offset in range(0, 100, 55):
        # VERTICAL LINES DOWN             (X1 , Y1)        (X2,  Y2)
        pygame.draw.line(screen,BLACK,[40+offset,50],[40+offset,100],2)
        # HORIZONTAL LINES DOWN          (X1 , Y1)        (X2,  Y2)
        pygame.draw.line(screen,BLACK,[40,45+offset],[100,45+offset],2)

# FIX THE OFFSETS AND GET THEM TO LINE UP PROPERLY

        
    # Draw screen
    pygame.display.flip()

    # Limit frames
    clock.tick(60)
    

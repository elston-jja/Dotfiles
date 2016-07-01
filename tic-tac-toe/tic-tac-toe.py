import pygame,os
global done

class Box(pygame.sprite.Sprite):

    def __init__(self, x, y):
        pygame.sprite.Sprite.__init__(self)
        self.width = 170
        self.height = 170
        self.image = pygame.Surface([self.width,self.height])
        self.image.fill((255,255,255))
        self.image.set_colorkey((255,255,255))
        self.rect = self.image.get_rect()
        self.rect.x = x
        self.rect.y = y
        all_sprites_group.add(self)

    def get_mouse_pos(self):
        self.mouse = pygame.mouse.get_pos()

        self.mouse_x = self.mouse[0]
        self.mouse_y = self.mouse[1]
        
        if self.rect.x < self.mouse_x < self.rect.right:
            if self.rect.y < self.mouse_y < self.rect.bottom:

                block_exists = self.check_block(self.rect.x,self.rect.y)
                if block_exists:
                    pass
                else:
                    x_turn = game.current_turn()
                    if x_turn:
                        piece = X_piece(self.rect.x,self.rect.y)
                        game.x_turn = not game.x_turn
                    else:
                        piece = O_piece(self.rect.x,self.rect.y)
                        game.x_turn = not game.x_turn

    def check_block(self, x, y):
        for piece in pieces_group:
            if piece.rect.x == x:
                if piece.rect.y == y:
                    return True

    def update(self):
        pass
        

class Piece(pygame.sprite.Sprite):

    def __init__(self,x,y):

        pygame.sprite.Sprite.__init__(self)

        self.x = x
        self.y = y
        self.width = 170
        self.height = 170
        self.image = pygame.Surface([self.width,self.height])
        self.rect = self.image.get_rect()
        self.image.fill((255,255,255))
        self.image.set_colorkey((255,255,255))
        self.rect.x = self.x
        self.rect.y = self.y
        all_sprites_group.add(self)
        pieces_group.add(self)

    def get_mouse_pos(self):
        pass

class X_piece(Piece):

    def __init__(self, x, y):
        Piece.__init__(self, x, y)
        self.x_image = pygame.image.load("Images/x.png").convert_alpha()
        self.name = "x"


    def update(self):
        screen.blit(self.x_image,(self.x + 50,self.y + 50))

class O_piece(Piece):

    def __init__(self, x, y):
        Piece.__init__(self, x, y)
        self.o_image = pygame.image.load("Images/o.png").convert_alpha()
        self.name = "o"

    def update(self):
        screen.blit(self.o_image,(self.x + 50,self.y + 50))


class Game:

    def __init__(self):
        self.turn_number = 0
        self.x_turn = True
        self.done = False
        
    def current_turn(self):
        if self.x_turn:
            return True
        else:
            return False
        
    def check_win(self):

        for block in pieces_group:
            self.name = block.name
            firstx = block.rect.x
            firsty = block.rect.y

            for block in pieces_group:
                if block.name == self.name:

                    if block.rect.x + 170 == firstx:
                        if block.rect.y + 170 == firsty:

                            secondx = block.rect.x
                            secondy = block.rect.y
                            for block in pieces_group:
                                if block.name == self.name:
                                    if block.rect.x + 340 == firstx:
                                        if block.rect.y + 340 == firsty:
                                            self.win()

                    elif block.rect.x - 170 == firstx:
                        if block.rect.y + 170 == firsty:

                            secondx = block.rect.x
                            secondy = block.rect.y 
                            for block2 in pieces_group:
                                if block2.name == self.name:
                                    if block2.rect.x - 340 == firstx:
                                        if block2.rect.y + 340 == firsty:
                                            self.win()
                                            

                    if block.rect.x == firstx:
                        if block.rect.y - 170 == firsty:
                            for block2 in pieces_group:
                                if block2.name == self.name:
                                    if block2.rect.x == firstx:
                                        if block2.rect.y - 340 == firsty:
                                            self.win()
                                            

                    elif block.rect.y == firsty:
                        if block.rect.x - 170 == firstx:
                            for block2 in pieces_group:
                                if block2.name == self.name:
                                    if block2.rect.y == firsty:
                                        if block2.rect.x - 340 == firstx:
                                            self.win()
                                            
    def win(self):

        print ("Therefore the winner is " + self.name)
        self.done = True
        # Not needed, but only prints winner once
        exit()


class Ai():
    # Removed AI as did not function well
    pass

                
pygame.init()

                
all_sprites_group = pygame.sprite.Group()
pieces_group = pygame.sprite.Group()

box0 = Box(0,0)
box1 = Box(170,0)
box2 = Box(340,0)
box3 = Box(0,170)
box4 = Box(170,170)
box5 = Box(340,170)
box6 = Box(0,340)
box7 = Box(170,340)
box8 = Box(340,340)

game = Game()

size = (512,512)

screen = pygame.display.set_mode(size)

background = pygame.image.load("Images/background.jpg").convert_alpha()

while not game.done:

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            game.done = True
        elif event.type == pygame.MOUSEBUTTONUP:
            for box in all_sprites_group:
                box.get_mouse_pos()
                game.check_win()

    screen.blit(background,(0,0))
    all_sprites_group.draw(screen)
    all_sprites_group.update()
    
    pygame.display.flip()
pygame.quit()

